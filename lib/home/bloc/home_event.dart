part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LoadExcelHomeEvent extends HomeEvent {
  final Uint8List? excelBytes;
  const LoadExcelHomeEvent({required this.excelBytes});
}

class UnloadExcelHomeEvent extends HomeEvent {
  const UnloadExcelHomeEvent();
}

class InsertFromExcelToLocalHomeEvent extends HomeEvent {
  const InsertFromExcelToLocalHomeEvent();
}

class LoadFromDBHomeEvent extends HomeEvent {
  const LoadFromDBHomeEvent();
}

class WatchFromDBHomeEvent extends HomeEvent {
  const WatchFromDBHomeEvent();
}

class SaveToExcelHomeEvent extends HomeEvent {
  const SaveToExcelHomeEvent();
}

class CalculateAgeStatisticsHomeEvent extends HomeEvent {
  const CalculateAgeStatisticsHomeEvent();
}
