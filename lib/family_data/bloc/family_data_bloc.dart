import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'family_data_event.dart';
part 'family_data_state.dart';

class FamilyDataBloc extends Bloc<FamilyDataEvent, FamilyDataState> {
  FamilyDataBloc() : super(FamilyDataInitial()) {
    on<FamilyDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
