part of 'family_data_bloc.dart';

@immutable
class FamilyDataEvent extends Equatable {
  const FamilyDataEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllFamilyFamilyDataEvent extends FamilyDataEvent {
  const GetAllFamilyFamilyDataEvent();
}
class WatchAllFamilyFamilyDataEvent extends FamilyDataEvent {
  const WatchAllFamilyFamilyDataEvent();
}
class InsertFamilyFamilyDataEvent extends FamilyDataEvent {
  const InsertFamilyFamilyDataEvent();
}
class GetAllFamilyFromCampFamilyDataEvent extends FamilyDataEvent {
  const GetAllFamilyFromCampFamilyDataEvent();
}

class WatchAllFamilyFromCampFamilyDataEvent extends FamilyDataEvent {
  const WatchAllFamilyFromCampFamilyDataEvent();
}

class WatchAllFamilyFromRegionFamilyDataEvent extends FamilyDataEvent {
  const WatchAllFamilyFromRegionFamilyDataEvent();
}
class WatchAllFamilyFromLocationFamilyDataEvent extends FamilyDataEvent {
  const WatchAllFamilyFromLocationFamilyDataEvent();
}
