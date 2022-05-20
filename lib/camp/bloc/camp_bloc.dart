import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:excel_native/camp/camp.dart';
import 'package:excel_native/definitions/camp.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'camp_event.dart';
part 'camp_state.dart';

class CampBloc extends Bloc<CampEvent, CampState> {
  final MyDatabase db;
  CampBloc({required this.db})
      : super(const CampState(campStatus: CampStatus.ready)) {
    on<GetAllCampsCampEvent>(_getAllCampsCampEvent);
    on<CreateCampCampEvent>(_createCampCampEvent);
    on<DebugCampEvent>(_debugCampEvent);
    on<GetAllLocationsCampEvent>(_getAllLocationsCampEvent);
    on<GetAllCampsWithLocationsCampEvent>(_getAllCampsWithLocationsCampEvent);
    on<CreateLocationCampEvent>(_createLocationCampEvent);
    on<CreateRegionFromLocationCampEvent>(_createRegionFromLocationCampEvent);
    on<WatchAllLocationsCampEvent>(_watchAllLocationsCampEvent);
    add(const GetAllLocationsCampEvent());
    // add(const WatchAllLocationsCampEvent());
  }

  FutureOr<void> _getAllCampsCampEvent(
      GetAllCampsCampEvent event, Emitter<CampState> emit) async {
    var dao = db.campDao;
    emit(state.copyWith(campStatus: CampStatus.loading));
    List<Camp> l = await dao.getAllCamps();
    List<CampLocalData> campLocalDataList = l.map((e) {
      return CampLocalData.fromCamp(e);
    }).toList();
    emit(state.copyWith(
        campsList: campLocalDataList, campStatus: CampStatus.ready));
  }

  FutureOr<void> _createCampCampEvent(
      CreateCampCampEvent event, Emitter<CampState> emit) async {
    var dao = db.campDao;
    await dao.insertCamp(const CampsCompanion(location: Value("Location")));
  }

  FutureOr<void> _debugCampEvent(
      DebugCampEvent event, Emitter<CampState> emit) {
    emit(state.copyWith(campStatus: CampStatus.error));
  }

  FutureOr<void> _getAllLocationsCampEvent(
      GetAllLocationsCampEvent event, Emitter<CampState> emit) async {
    print("getting locations...");
    if (state.campStatus != CampStatus.ready) {
      print("process already in course...");
      return null;
    }
    emit(state.copyWith(campStatus: CampStatus.loading));
    var dao = db.locationDao;
    List<Location> l = await dao.getAllLocations();
    var regionDao = db.regionDao;
    Map<Location, List<Region>> m =
        Map<Location, List<Region>>.from(state.regionsWithLocations!);
    for (var element in l) {
      var k = await regionDao.getAllRegionsFromLocation(
          pLocation: element.location);
      m[element] = k;
    }
    emit(state.copyWith(
      campStatus: CampStatus.ready,
      locationsList: l,
      regionsWithLocations: m,
    ));
    print("done getting locations.");
  }

  FutureOr<void> _watchAllLocationsCampEvent(
      WatchAllLocationsCampEvent event, Emitter<CampState> emit) async {
    if (state.campStatus != CampStatus.ready) {
      return null;
    }
    emit(state.copyWith(campStatus: CampStatus.loading));
    var dao = db.locationDao;
    Stream<List<Location>> l = dao.watchAllLocations();

    var regionDao = db.regionDao;
    Map<Location, List<Region>> m =
        Map<Location, List<Region>>.from(state.regionsWithLocations!);
    var arr = await l.first;
    for (var element in arr) {
      var k =
          regionDao.watchAllRegionsFromLocation(pLocation: element.location);
      m[element] = await k.first;
    }
    emit(state.copyWith(
      campStatus: CampStatus.ready,
      locationsList: arr,
      regionsWithLocations: m,
    ));
  }

  FutureOr<void> _getAllCampsWithLocationsCampEvent(
      GetAllCampsWithLocationsCampEvent event, Emitter<CampState> emit) async {
    var dao = db.campDao;
    Map<Location, List<Camp>> m =
        Map<Location, List<Camp>>.from(state.campsWithLocations!);
    var l = state.locationsList!;
    for (var element in l) {
      var k = await dao.getAllCampsFromLocation(pLocation: element.location);
      m[element] = k;
    }
  }

  FutureOr<void> _createLocationCampEvent(
      CreateLocationCampEvent event, Emitter<CampState> emit) async {
    if (state.campStatus != CampStatus.ready) {
      return null;
    }
    emit(state.copyWith(campStatus: CampStatus.loading));
    var dao = db.locationDao;
    await dao
        .createLocation(LocationsCompanion(location: Value(event.location)));
    emit(state.copyWith(campStatus: CampStatus.ready));
  }

  FutureOr<void> _createRegionFromLocationCampEvent(
      CreateRegionFromLocationCampEvent event, Emitter<CampState> emit) async {
    if (state.campStatus != CampStatus.ready) {
      return null;
    }
    emit(state.copyWith(campStatus: CampStatus.loading));
    var dao = db.regionDao;
    await dao.insertRegion(
        regionsCompanion: RegionsCompanion(
            region: Value(event.newRegion),
            location: Value(event.location.location)));

    emit(state.copyWith(campStatus: CampStatus.ready));
  }
}
