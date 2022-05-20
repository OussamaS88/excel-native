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
      : super(const FamilyDataState(fdStatus: FDStatus.ready, familyList: [])) {
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
        return state.copyWith(
          fdStatus: FDStatus.ready,
          familyList: List<Family>.from(data as Iterable),
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
