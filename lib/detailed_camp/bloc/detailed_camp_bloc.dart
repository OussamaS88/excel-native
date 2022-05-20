import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
part 'detailed_camp_event.dart';
part 'detailed_camp_state.dart';

class DetailedCampBloc extends Bloc<DetailedCampEvent, DetailedCampState> {
  final MyDatabase db;
  final Region region;
  DetailedCampBloc({
    required this.db,
    required this.region,
  }) : super(DetailedCampState(dcStatus: DCStatus.ready, region: region)) {
    on<GetAllCampsFromRegionDetailedCampEvent>(
        _getAllCampsFromRegionDetailedCampEvent);
    on<WatchAllCampsFromRegionDetailedCampEvent>(
        _watchAllCampsFromRegionDetailedCampEvent);
    on<InsertCampsFromRegionDetailedCampEvent>(
        _insertCampsFromRegionDetailedCampEvent);
  }

  FutureOr<void> _getAllCampsFromRegionDetailedCampEvent(
      GetAllCampsFromRegionDetailedCampEvent event,
      Emitter<DetailedCampState> emit) async {
    if (state.dcStatus != DCStatus.ready) return;
    emit(state.copyWith(dcStatus: DCStatus.loading));
    var dao = db.campDao;
    List<Camp> k = await dao.getAllCampsFromRegion(pRegion: region.region);
    print(k);
    emit(state.copyWith(dcStatus: DCStatus.ready, campsList: k));
  }

  FutureOr<void> _watchAllCampsFromRegionDetailedCampEvent(
      WatchAllCampsFromRegionDetailedCampEvent event,
      Emitter<DetailedCampState> emit) async {
    if (state.dcStatus != DCStatus.ready) return;
    emit(state.copyWith(dcStatus: DCStatus.loading));
    var dao = db.campDao;
    emit.forEach(
      dao.watchAllCampsFromRegion(pRegion: region.region),
      onData: (data) {
        return state.copyWith(
            dcStatus: DCStatus.ready,
            campsList: List<Camp>.from(data as Iterable));
      },
    );
  }

  FutureOr<void> _insertCampsFromRegionDetailedCampEvent(
      InsertCampsFromRegionDetailedCampEvent event,
      Emitter<DetailedCampState> emit) async {
    if (state.dcStatus != DCStatus.ready) return;
    emit(state.copyWith(dcStatus: DCStatus.loading));
    var dao = db.campDao;
    await dao.insertCamp(CampsCompanion(
      name: Value(event.campName),
      location: Value(region.location),
      region: Value(region.region),
    ));
    emit(state.copyWith(dcStatus: DCStatus.ready));
  }
}
