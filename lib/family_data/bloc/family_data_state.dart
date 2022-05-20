part of 'family_data_bloc.dart';

enum FDStatus {
  error,
  loading,
  ready,
}

class FamilyDataState extends Equatable {
  final FDStatus fdStatus;
  final List<Family> familyList;

  const FamilyDataState({required this.fdStatus, required this.familyList});

  FamilyDataState copyWith({
    FDStatus? fdStatus,
    List<Family>? familyList,
  }) {
    return FamilyDataState(
      fdStatus: fdStatus ?? this.fdStatus,
      familyList: familyList ?? this.familyList,
    );
  }

  @override
  List<Object?> get props => [
        fdStatus,
        familyList,
      ];
}
