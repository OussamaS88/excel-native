import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'family_data_event.dart';
part 'family_data_state.dart';

class FamilyDataBloc extends Bloc<FamilyDataEvent, FamilyDataState> {
  final MyDatabase db;
  final Camp camp;
  FamilyDataBloc({required this.db, required this.camp})
      : super(const FamilyDataState(
          fdStatus: FDStatus.ready,
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
}
