import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'camp_event.dart';
part 'camp_state.dart';

class CampBloc extends Bloc<CampEvent, CampState> {
  CampBloc() : super(CampInitial()) {
    on<CampEvent>((event, emit) {
    });
  }
}
