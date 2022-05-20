part of 'camp_bloc.dart';

enum CampStatus {
  error,
  ready,
  loading,
}

class CampState extends Equatable {
  final CampStatus campStatus;
  final List<CampLocalData>? campsList;
  final List<Region>? regionsList;
  final List<Location>? locationsList;
  final Map<Location, List<Camp>>? campsWithLocations;
  final Map<Location, List<Region>>? regionsWithLocations;

  const CampState({
    required this.campStatus,
    this.campsList = const [],
    this.locationsList = const [],
    this.campsWithLocations = const {},
    this.regionsList = const [],
    this.regionsWithLocations = const {},
  });
  @override
  List<Object?> get props => [campStatus];

  CampState copyWith({
    CampStatus? campStatus,
    List<CampLocalData>? campsList,
    List<Location>? locationsList,
    List<Region>? regionsList,
    Map<Location, List<Camp>>? campsWithLocations,
    Map<Location, List<Region>>? regionsWithLocations,
  }) {
    return CampState(
      campStatus: campStatus ?? this.campStatus,
      campsList: campsList ?? this.campsList,
      locationsList: locationsList ?? this.locationsList,
      campsWithLocations: campsWithLocations ?? this.campsWithLocations,
      regionsList: regionsList ?? this.regionsList,
      regionsWithLocations: regionsWithLocations ?? this.regionsWithLocations,
    );
  }
}
