part of 'detailed_camp_bloc.dart';

enum DCStatus {
  error,
  ready,
  loading,
}

class DetailedCampState extends Equatable {
  final DCStatus dcStatus;
  final List<Camp> campsList;
  final Region region;

  const DetailedCampState(
      {required this.dcStatus,
      this.campsList = const [],
      required this.region});

  DetailedCampState copyWith({
    DCStatus? dcStatus,
    List<Camp>? campsList,
    Region? region,
  }) {
    return DetailedCampState(
      dcStatus: dcStatus ?? this.dcStatus,
      campsList: campsList ?? this.campsList,
      region: region ?? this.region,
    );
  }

  @override
  List<Object?> get props => [
        dcStatus,
        campsList,
      ];
}
