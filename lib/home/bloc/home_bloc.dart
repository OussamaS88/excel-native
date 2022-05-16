import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_api/excel_api.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ExcelApi _excelApi;
  HomeBloc(this._excelApi) : super(const HomeState()) {
    on<LoadExcelHomeEvent>(_loadExcelHomeEvent);
    on<InsertFromExcelToLocalHomeEvent>(_insertFromExcelToLocalHomeEvent);
    on<UnloadExcelHomeEvent>(_unloadExcelHomeEvent);
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
          _excelApi.readRowsToExcelRowsFromBytes(event.excelBytes!);
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
    var dao = event.db.localExcelDataDao;

    await dao.insertMultipleLocalExcelData(state.excelRows!);
    print("done inserting.");
    emit(state.copyWith(
        homeStatus: HomeStatus.ready, homeLocalStatus: HomeLocalStatus.idle));
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
}
