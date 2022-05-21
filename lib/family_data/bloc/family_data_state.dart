part of 'family_data_bloc.dart';

enum FDStatus {
  error,
  loading,
  ready,
}

enum FamilyExcelStatus { error, loaded, unloaded }

class FamilyDataState extends Equatable {
  final FDStatus fdStatus;
  final FamilyExcelStatus familyExcelStatus;
  final List<Family> familyList;
  final List<ExcelRow> excelRows;
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
    required this.familyExcelStatus,
    required this.excelRows,
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
    FamilyExcelStatus? familyExcelStatus,
    List<ExcelRow>? excelRows,
  }) {
    return FamilyDataState(
      fdStatus: fdStatus ?? this.fdStatus,
      familyExcelStatus: familyExcelStatus ?? this.familyExcelStatus,
      excelRows: excelRows ?? this.excelRows,
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
        familyExcelStatus,
        familyList,
        peopleCount,
        womenCount,
        childrenCount,
        elderlyCount,
        casesCount,
        eduCount,
        empCount,
        unempCount,
        excelRows,
      ];
}
