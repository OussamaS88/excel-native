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

class CreateCampCampEvent extends CampEvent {
  const CreateCampCampEvent();
}
class DebugCampEvent extends CampEvent {
  const DebugCampEvent();
}
