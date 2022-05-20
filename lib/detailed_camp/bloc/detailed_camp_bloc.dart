import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detailed_camp_event.dart';
part 'detailed_camp_state.dart';

class DetailedCampBloc extends Bloc<DetailedCampEvent, DetailedCampState> {
  DetailedCampBloc() : super(DetailedCampInitial()) {
    on<DetailedCampEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
