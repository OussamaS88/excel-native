part of 'detailed_camp_bloc.dart';

@immutable
abstract class DetailedCampEvent extends Equatable {
  const DetailedCampEvent();
  @override
  List<Object> get props => [];
}

class GetAllCampsFromRegionDetailedCampEvent extends DetailedCampEvent {
  const GetAllCampsFromRegionDetailedCampEvent();
}

class WatchAllCampsFromRegionDetailedCampEvent extends DetailedCampEvent {
  const WatchAllCampsFromRegionDetailedCampEvent();
}

class InsertCampsFromRegionDetailedCampEvent extends DetailedCampEvent {
  final String campName;
  const InsertCampsFromRegionDetailedCampEvent({required this.campName});
}
