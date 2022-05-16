part of 'home_bloc.dart';

enum HomeExcelStatus {
  empty,
  loaded,
  error,
}

enum HomeLocalStatus {
  idle,
  inserting,
  error,
}

enum HomeStatus {
  ready,
  loading,
  error,
}

class HomeState extends Equatable {
  final HomeExcelStatus homeExcelStatus;
  final HomeLocalStatus homeLocalStatus;
  final String? errorMessage;
  final List<ExcelRow>? excelRows;
  final Uint8List? excelBytes;
  final HomeStatus homeStatus;

  const HomeState({
    this.homeStatus = HomeStatus.ready,
    this.homeExcelStatus = HomeExcelStatus.empty,
    this.homeLocalStatus = HomeLocalStatus.idle,
    this.errorMessage,
    this.excelRows = const [],
    this.excelBytes,
  });

  @override
  List<Object?> get props => [homeExcelStatus, homeLocalStatus];

  HomeState copyWith({
    HomeExcelStatus? homeExcelStatus,
    HomeLocalStatus? homeLocalStatus,
    HomeStatus? homeStatus,
    String? errorMessage,
    List<ExcelRow>? excelRows,
    Uint8List? excelBytes,
  }) {
    return HomeState(
      homeExcelStatus: homeExcelStatus ?? this.homeExcelStatus,
      homeLocalStatus: homeLocalStatus ?? this.homeLocalStatus,
      homeStatus: homeStatus ?? this.homeStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      excelRows: excelRows ?? this.excelRows,
      excelBytes: excelBytes ?? this.excelBytes,
    );
  }
}
