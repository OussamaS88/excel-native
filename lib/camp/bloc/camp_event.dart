part of 'camp_bloc.dart';

@immutable
abstract class CampEvent extends Equatable {
  const CampEvent();
  @override
  List<Object> get props => [];
}

class GetAllCampsCampEvent extends CampEvent {
  const GetAllCampsCampEvent();
}

class GetAllLocationsCampEvent extends CampEvent {
  const GetAllLocationsCampEvent();
}

class CreateCampCampEvent extends CampEvent {
  const CreateCampCampEvent();
}

class DebugCampEvent extends CampEvent {
  const DebugCampEvent();
}

class GetAllCampsWithLocationsCampEvent extends CampEvent {
  const GetAllCampsWithLocationsCampEvent();
}

class CreateLocationCampEvent extends CampEvent {
  const CreateLocationCampEvent();
}

class CreateRegionFromLocationCampEvent extends CampEvent {
  final Location location;
  const CreateRegionFromLocationCampEvent({required this.location});
}
