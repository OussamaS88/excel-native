part of 'family_data_bloc.dart';

enum FDStatus {
  error,
  loading,
  ready,
}

class FamilyDataState extends Equatable {
  final FDStatus fdStatus;
  final List<Family> familyList;
  final int peopleCount;
  final int womenCount;
  final int childrenCount;
  final int elderlyCount;
  final int casesCount;
  final int eduCount;
  final int empCount;
  final int unempCount;
  const FamilyDataState({
    required this.fdStatus,
    required this.familyList,
    required this.peopleCount,
    required this.womenCount,
    required this.childrenCount,
    required this.elderlyCount,
    required this.eduCount,
    required this.casesCount,
    required this.empCount,
    required this.unempCount,
  });

  FamilyDataState copyWith({
    FDStatus? fdStatus,
    List<Family>? familyList,
    int? peopleCount,
    int? womenCount,
    int? childrenCount,
    int? elderlyCount,
    int? casesCount,
    int? eduCount,
    int? empCount,
    int? unempCount,
  }) {
    return FamilyDataState(
      fdStatus: fdStatus ?? this.fdStatus,
      familyList: familyList ?? this.familyList,
      peopleCount: peopleCount ?? this.peopleCount,
      womenCount: womenCount ?? this.womenCount,
      childrenCount: childrenCount ?? this.childrenCount,
      elderlyCount: elderlyCount ?? this.elderlyCount,
      casesCount: casesCount ?? this.casesCount,
      eduCount: eduCount ?? this.eduCount,
      empCount: empCount ?? this.empCount,
      unempCount: unempCount ?? this.unempCount,
    );
  }

  @override
  List<Object?> get props => [
        fdStatus,
        familyList,
        peopleCount,
        womenCount,
        childrenCount,
        elderlyCount,
        casesCount,
        eduCount,
        empCount,
        unempCount,
      ];
}
