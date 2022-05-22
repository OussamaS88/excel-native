import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_api/excel_api.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'family_data_event.dart';
part 'family_data_state.dart';

class FamilyDataBloc extends Bloc<FamilyDataEvent, FamilyDataState> {
  final ExcelApi excelApi;
  final MyDatabase db;
  final Camp camp;
  FamilyDataBloc({required this.db, required this.camp, required this.excelApi})
      : super(const FamilyDataState(
          fdStatus: FDStatus.ready,
          excelRows: [],
          familyExcelStatus: FamilyExcelStatus.unloaded,
          familyList: [],
          casesCount: 0,
          childrenCount: 0,
          eduCount: 0,
          elderlyCount: 0,
          empCount: 0,
          peopleCount: 0,
          unempCount: 0,
          womenCount: 0,
        )) {
    on<GetAllFamilyFromCampFamilyDataEvent>(
        _getAllFamilyFromCampFamilyDataEvent);
    on<WatchAllFamilyFromCampFamilyDataEvent>(
        _watchAllFamilyFromCampFamilyDataEvent);
    on<InsertFamilyFamilyDataEvent>(_insertFamilyFamilyDataEvent);
    on<ExportToExcelFamilyDataEvent>(_exportToExcelFamilyDataEvent);
    on<LoadFromExcelFamilyDataEvent>(_loadFromExcelFamilyDataEvent);
    on<ExcelToDBFamilyDataEvent>(_excelToDBFamilyDataEvent);
    add(const WatchAllFamilyFromCampFamilyDataEvent());
  }

  FamilysCompanion defFcomp() {
    return FamilysCompanion(
      campId: Value(camp.id),
      tentId: const Value(1),
      location: Value(camp.location),
      region: Value(camp.region),
      nameEng: const Value("A B C"),
      nameAr: const Value("d e f"),
      phoneNum: const Value("+96170123456"),
      wfpAid: const Value("yes"),
      unhcr: const Value("00-00-00-00-00"),
      peopleCount: const Value(5),
      womenCount: const Value(2),
      childrenCount: const Value(2),
      elderlyCount: const Value(1),
      casesCount: const Value(2),
      educationCount: const Value(2),
      employedCount: const Value(1),
      unemployedCount: const Value(4),
      notes1: const Value("note"),
      notes2: const Value(""),
    );
  }

  FutureOr<void> _getAllFamilyFromCampFamilyDataEvent(
      GetAllFamilyFromCampFamilyDataEvent event,
      Emitter<FamilyDataState> emit) async {
    if (state.fdStatus != FDStatus.ready) return null;
    var dao = db.familyDao;
    emit(state.copyWith(fdStatus: FDStatus.loading));
    var k = await dao.getAllFamilysFromCamp(camp: camp);
    emit(state.copyWith(fdStatus: FDStatus.ready, familyList: k));
  }

  FutureOr<void> _watchAllFamilyFromCampFamilyDataEvent(
      WatchAllFamilyFromCampFamilyDataEvent event,
      Emitter<FamilyDataState> emit) async {
    if (state.fdStatus != FDStatus.ready) return null;
    var dao = db.familyDao;
    emit(state.copyWith(fdStatus: FDStatus.loading));
    await emit.forEach(
      dao.watchAllFamilysFromCamp(camp: camp),
      onData: (data) {
        List<Family> familyList = List<Family>.from(data as Iterable);
        int peopleCount = 0;
        int womenCount = 0;
        int childrenCount = 0;
        int elderlyCount = 0;
        int casesCount = 0;
        int eduCount = 0;
        int empCount = 0;
        int unempCount = 0;
        for (var element in familyList) {
          peopleCount += element.peopleCount;
          womenCount += element.womenCount;
          childrenCount += element.childrenCount;
          elderlyCount += element.elderlyCount;
          casesCount += element.casesCount;
          eduCount += element.educationCount;
          empCount += element.employedCount;
          unempCount += element.unemployedCount;
        }
        return state.copyWith(
          fdStatus: FDStatus.ready,
          familyList: familyList,
          peopleCount: peopleCount,
          womenCount: womenCount,
          childrenCount: childrenCount,
          elderlyCount: elderlyCount,
          casesCount: casesCount,
          eduCount: eduCount,
          empCount: empCount,
          unempCount: unempCount,
        );
      },
    );
  }

  FutureOr<void> _insertFamilyFamilyDataEvent(
      InsertFamilyFamilyDataEvent event, Emitter<FamilyDataState> emit) async {
    if (state.fdStatus != FDStatus.ready) return null;
    var dao = db.familyDao;
    emit(state.copyWith(fdStatus: FDStatus.loading));
    await dao.insertFamily(familysCompanion: defFcomp());
    emit(state.copyWith(fdStatus: FDStatus.ready));
  }

  FutureOr<void> _exportToExcelFamilyDataEvent(
      ExportToExcelFamilyDataEvent event, Emitter<FamilyDataState> emit) async {
    if (state.fdStatus != FDStatus.ready) return null;
    emit(state.copyWith(fdStatus: FDStatus.loading));
    List<ExcelRow> excelRows = [];
    // var originalExcel = await rootBundle.load('assets/DATA_STRUCTURE.xlsx');
    var originalExcel = await rootBundle.load('assets/FINAL_STRUCTURE.xlsx');
    var bytes = originalExcel.buffer.asUint8List();
    List<Family> familyList = state.familyList;
    for (var family in familyList) {
      var k = [];
      k.add(family.id);
      k.add(family.tentId);
      k.add(family.nameEng);
      k.add(family.nameAr);
      k.add(family.phoneNum);
      k.add(family.wfpAid);
      k.add(family.unhcr);
      k.add(family.peopleCount);
      k.add(family.womenCount);
      k.add(family.childrenCount);
      k.add(family.elderlyCount);
      k.add(family.casesCount);
      k.add(family.educationCount);
      k.add(family.employedCount);
      k.add(family.unemployedCount);
      k.add(family.notes1);
      k.add(family.notes2);
      excelRows.add(ExcelRow(mp: k));
    }
    excelApi.exportToDataStructureFromBytes(
      excelBytes: bytes,
      excelRows: excelRows,
    );
    emit(state.copyWith(fdStatus: FDStatus.ready));
  }

  FutureOr<void> _loadFromExcelFamilyDataEvent(
      LoadFromExcelFamilyDataEvent event, Emitter<FamilyDataState> emit) async {
    if (state.fdStatus != FDStatus.ready) return null;
    emit(state.copyWith(fdStatus: FDStatus.loading));
    if (event.excelBytes == null) {
      emit(state.copyWith(
        fdStatus: FDStatus.error,
      ));
      return null;
    }
    try {
      List<ExcelRow> l =
          excelApi.readRowsToExcelRowsFromBytes(event.excelBytes!);
      emit(state.copyWith(
        fdStatus: FDStatus.ready,
        familyExcelStatus: FamilyExcelStatus.loaded,
        excelRows: l,
      ));
      // print("Loaded data successfully.");
    } catch (e) {
      emit(state.copyWith(
        familyExcelStatus: FamilyExcelStatus.error,
        fdStatus: FDStatus.error,
      ));
      print(e);
      return null;
    }
  }

  FutureOr<void> _excelToDBFamilyDataEvent(
      ExcelToDBFamilyDataEvent event, Emitter<FamilyDataState> emit) async {
    if (state.fdStatus != FDStatus.ready) return null;
    emit(state.copyWith(fdStatus: FDStatus.loading));
    List<ExcelRow> excelRows = state.excelRows;
    print("Inserting ${excelRows.length} rows into db...");
    if (excelRows.length < 5) {
      emit(state.copyWith(fdStatus: FDStatus.ready));
      return null;
    }
    var dao = db.familyDao;
    // int i = 3;
    int i = 6;
    for (var row in excelRows) {
      if (i >= 0) {
        i--;
        continue;
      }
      FamilysCompanion familysCompanion = FamilysCompanion(
        campId: Value(camp.id),
        location: Value(camp.location),
        region: Value(camp.region),
        id: Value(row.mp[0]),
        tentId: Value(row.mp[1]),
        nameEng: Value(row.mp[2]),
        nameAr: Value(row.mp[3]),
        phoneNum: Value(row.mp[4]),
        wfpAid: Value(row.mp[5]),
        unhcr: Value(row.mp[6]),
        peopleCount: Value(row.mp[7]),
        womenCount: Value(row.mp[8]),
        childrenCount: Value(row.mp[9]),
        elderlyCount: Value(row.mp[10]),
        casesCount: Value(row.mp[11]),
        educationCount: Value(row.mp[12]),
        unemployedCount: Value(row.mp[13]),
        employedCount: Value(row.mp[14]),
        notes1: Value(row.mp[15]),
        notes2: Value(row.mp[16]),
      );
      print(familysCompanion);
      await dao.insertFamily(familysCompanion: familysCompanion);
    }
    print("done");
    emit(state.copyWith(fdStatus: FDStatus.ready));
  }
}
