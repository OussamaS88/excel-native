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
    add(const GetAllCampsCampEvent());
  }

  FutureOr<void> _getAllCampsCampEvent(
      GetAllCampsCampEvent event, Emitter<CampState> emit) async {
    var dao = db.campDao;
    emit(state.copyWith(campStatus: CampStatus.loading));
    List<Camp> l = await dao.getAllCamps();
    print(l);
    List<CampLocalData> campLocalDataList = l.map((e) {
      return CampLocalData.fromCamp(e);
    }).toList();
    print(campLocalDataList);
    emit(state.copyWith(campsList: campLocalDataList, campStatus: CampStatus.ready));
    // emit(state.copyWith(campStatus: CampStatus.ready));
    print("done");
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
}
