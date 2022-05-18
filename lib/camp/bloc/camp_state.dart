part of 'camp_bloc.dart';

enum CampStatus {
  error,
  ready,
  loading,
}

class CampState extends Equatable {
  final CampStatus campStatus;
  final List<CampLocalData>? campsList;

  const CampState({
    required this.campStatus,
    this.campsList = const [],
  });
  @override
  List<Object?> get props => [campStatus];

  CampState copyWith({
    CampStatus? campStatus,
    List<CampLocalData>? campsList,
  }) {
    // print("www");
    // print(campStatus);
    print("state list :");
    print(campsList);
    return CampState(
      campStatus: campStatus ?? this.campStatus,
      campsList: campsList ?? this.campsList,
    );
  }
}
