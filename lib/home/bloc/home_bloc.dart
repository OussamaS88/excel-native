import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_api/excel_api.dart';
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
  }

  FutureOr<void> _loadExcelHomeEvent(
      LoadExcelHomeEvent event, Emitter<HomeState> emit) {
    if (state.homeStatus != HomeStatus.ready) return null;
    if (state.homeExcelStatus == HomeExcelStatus.loaded) {
      print("cleaning loaded excel...");
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      emit(state.copyWith(
          excelBytes: null,
          excelRows: [],
          homeExcelStatus: HomeExcelStatus.empty));
      print("done cleaning.");
      emit(state.copyWith(homeStatus: HomeStatus.ready));
    }
    print("loading data...");
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
      print(state.excelRows);
      print("Loaded data successfully.");
    } catch (e) {
      emit(state.copyWith(
        homeExcelStatus: HomeExcelStatus.error,
        errorMessage: "Excel error occurred.",
        homeStatus: HomeStatus.ready,
      ));
      print("Error loading data.");
      return null;
    }
  }

  FutureOr<void> _insertFromExcelToLocalHomeEvent(
      InsertFromExcelToLocalHomeEvent event, Emitter<HomeState> emit) {}
}
