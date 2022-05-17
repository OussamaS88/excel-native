import 'dart:async';
import 'dart:io';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_api/excel_api.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ExcelApi excelApi;
  final MyDatabase db;
  HomeBloc({required this.excelApi, required this.db})
      : super(const HomeState()) {
    on<LoadExcelHomeEvent>(_loadExcelHomeEvent);
    on<InsertFromExcelToLocalHomeEvent>(_insertFromExcelToLocalHomeEvent);
    on<UnloadExcelHomeEvent>(_unloadExcelHomeEvent);
    on<LoadFromDBHomeEvent>(_loadFromDBHomeEvent);
    on<SaveToExcelHomeEvent>(_saveToExcelHomeEvent);
    on<WatchFromDBHomeEvent>(_watchFromDBHomeEvent);
    on<CalculateAgeStatisticsHomeEvent>(_calculateAgeStatisticsHomeEvent);
    add(const LoadFromDBHomeEvent());
  }

  FutureOr<void> _loadExcelHomeEvent(
      LoadExcelHomeEvent event, Emitter<HomeState> emit) {
    if (state.homeStatus != HomeStatus.ready) return null;
    if (state.homeExcelStatus == HomeExcelStatus.loaded) {
      // print("cleaning loaded excel...");
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      emit(state.copyWith(
          excelBytes: null,
          excelRows: [],
          homeExcelStatus: HomeExcelStatus.empty));
      // print("done cleaning.");
      emit(state.copyWith(homeStatus: HomeStatus.ready));
    }
    // print("loading data...");
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    if (event.excelBytes == null) {
      emit(state.copyWith(
        homeExcelStatus: HomeExcelStatus.error,
        errorMessage: "Missing file/Data corrupted.",
        homeStatus: HomeStatus.ready,
      ));
      return null;
    }
    try {
      List<ExcelRow> l =
          excelApi.readRowsToExcelRowsFromBytes(event.excelBytes!);
      emit(state.copyWith(
        homeExcelStatus: HomeExcelStatus.loaded,
        excelRows: l,
        homeStatus: HomeStatus.ready,
      ));
      // print("Loaded data successfully.");
    } catch (e) {
      emit(state.copyWith(
        homeExcelStatus: HomeExcelStatus.error,
        errorMessage: "Excel error occurred.",
        homeStatus: HomeStatus.ready,
      ));
      print(e);
      return null;
    }
  }

  FutureOr<void> _insertFromExcelToLocalHomeEvent(
      InsertFromExcelToLocalHomeEvent event, Emitter<HomeState> emit) async {
    if (state.homeStatus != HomeStatus.ready) return null;

    if (state.homeExcelStatus != HomeExcelStatus.loaded) {
      emit(state.copyWith(
        homeLocalStatus: HomeLocalStatus.error,
        errorMessage: "No excel file has been loaded.",
      ));
    }
    emit(state.copyWith(
        homeStatus: HomeStatus.loading,
        homeLocalStatus: HomeLocalStatus.inserting));
    print("inserting...");
    var dao = db.localExcelDataDao;
    try {
      await dao.insertMultipleLocalExcelData(state.excelRows!);

      print("done inserting.");
      emit(state.copyWith(
          homeStatus: HomeStatus.ready, homeLocalStatus: HomeLocalStatus.idle));
    } catch (e) {
      emit(state.copyWith(
        homeStatus: HomeStatus.ready,
        homeLocalStatus: HomeLocalStatus.error,
        errorMessage: "Could not insert into database",
      ));
    }
  }

  FutureOr<void> _unloadExcelHomeEvent(
      UnloadExcelHomeEvent event, Emitter<HomeState> emit) {
    if (state.homeStatus != HomeStatus.ready) {
      return null;
    }
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    if (state.homeExcelStatus != HomeExcelStatus.loaded) {
      emit(
        state.copyWith(
            homeStatus: HomeStatus.ready,
            homeExcelStatus: HomeExcelStatus.error,
            errorMessage: "No excel file has been loaded"),
      );
      return null;
    }
    emit(state.copyWith(
      homeStatus: HomeStatus.ready,
      homeExcelStatus: HomeExcelStatus.empty,
      excelBytes: null,
      excelRows: [],
    ));
  }

  FutureOr<void> _loadFromDBHomeEvent(
      LoadFromDBHomeEvent event, Emitter<HomeState> emit) async {
    if (state.homeStatus != HomeStatus.ready) return null;
    print("Reading from database...");
    emit(state.copyWith(
      homeStatus: HomeStatus.loading,
      homeLocalStatus: HomeLocalStatus.reading,
    ));
    var dao = db.localExcelDataDao;
    var l = await dao.getAllLocalExcelData();
    Map<int, int> ageStats = <int, int>{};
    List<ExcelRow> excelRows = l.map((e) {
      if (ageStats.containsKey(e.age)) {
        ageStats[e.age] = ageStats[e.age]! + 1;
      } else {
        ageStats[e.age] = 1;
      }
      return ExcelRow(
          mp: [e.id, e.fName, e.lName, e.location, e.phoneNumber, e.age]);
    }).toList();
    print(ageStats);
    //print(l);
    var p = _createAgeStatistics(ageStats);
    emit(state.copyWith(
      homeStatus: HomeStatus.ready,
      excelRowsFromDB: excelRows,
      homeLocalStatus: HomeLocalStatus.idle,
      seriesList: p,
    ));
  }

  FutureOr<void> _saveToExcelHomeEvent(
      SaveToExcelHomeEvent event, Emitter<HomeState> emit) async {
    if (state.homeStatus != HomeStatus.ready) return null;
    if (state.excelRowsFromDB!.isEmpty) {
      emit(state.copyWith(
        homeExcelStatus: HomeExcelStatus.error,
        homeStatus: HomeStatus.ready,
        errorMessage: "No data to save.",
      ));
      return null;
    }
    emit(state.copyWith(
      homeStatus: HomeStatus.loading,
    ));
    var originalExcel = await rootBundle.load('assets/data_root.xlsx');
    var bytes = originalExcel.buffer.asUint8List();
    excelApi.exportToExcelFromBytes(
        excelRows: state.excelRowsFromDB!, excelBytes: bytes);
    emit(state.copyWith(homeStatus: HomeStatus.ready));
  }

  FutureOr<void> _watchFromDBHomeEvent(
      WatchFromDBHomeEvent event, Emitter<HomeState> emit) async {
    if (state.homeStatus != HomeStatus.ready) return null;
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    await emit.forEach(
      db.localExcelDataDao.watchAllLocalExcelData(),
      onData: (data) {
        data as List<LocalExcelData>;
        return state.copyWith(
          homeLocalStatus: HomeLocalStatus.reading,
          homeStatus: HomeStatus.ready,
          excelRowsFromDB: data
              .map((e) => ExcelRow(mp: [
                    e.id,
                    e.fName,
                    e.lName,
                    e.location,
                    e.phoneNumber,
                    e.age
                  ]))
              .toList(),
        );
      },
    );
    emit(state.copyWith(homeStatus: HomeStatus.ready));
  }

  FutureOr<void> _calculateAgeStatisticsHomeEvent(
      CalculateAgeStatisticsHomeEvent event, Emitter<HomeState> emit) {
    if (state.homeStatus != HomeStatus.ready) return null;
    emit(state.copyWith(
      homeStatus: HomeStatus.ready,
    ));
  }
}

class AgeStatistics {
  final int age;
  final int quantity;

  AgeStatistics(this.age, this.quantity);
}

List<charts.Series<AgeStatistics, String>> _createAgeStatistics(
    Map<int, int> ageStats) {
  List<AgeStatistics> data = [];
  ageStats.forEach((key, value) {
    data.add(AgeStatistics(key, value));
  });

  return [
    charts.Series<AgeStatistics, String>(
      id: 'Age',
      domainFn: (AgeStatistics sales, _) => sales.age.toString(),
      measureFn: (AgeStatistics sales, _) => sales.quantity,
      data: data,
      // Set a label accessor to control the text of the arc label.
      labelAccessorFn: (AgeStatistics row, _) => '${row.age}: ${row.quantity}',
    )
  ];
}
