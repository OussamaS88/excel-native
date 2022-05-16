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

class InsertFromExcelToLocalHomeEvent extends HomeEvent {
  final MyDatabase db;
  const InsertFromExcelToLocalHomeEvent({required this.db});
}
