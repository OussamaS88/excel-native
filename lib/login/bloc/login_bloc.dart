import 'package:bloc/bloc.dart';
import 'package:excel_native/services/auth/auth_exceptions.dart';
import 'package:excel_native/services/auth/auth_service.dart';
import 'package:excel_native/services/auth/auth_user.dart';
import 'package:excel_native/utilities/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;
  LoginBloc(this._authService) : super(const LoginState()) {
    on<LoginTapped>(_loginTapped);
    on<LoginEmailChanged>(_emailChanged);
    on<LoginPasswordChanged>(_passwordChanged);
  }

  void _loginTapped(LoginTapped event, Emitter<LoginState> emit) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      var k = await _authService.logIn(
          email: state.email.value, password: state.password.value);
      if (k == AuthUser.empty) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: "Unknown"));
        return;
      }
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          password: state.password,
          email: state.email));
    } on LogInWithEmailAndPasswordException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.message));
    } on Exception catch (_) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: "Unknown"));
    }
  }

  void _emailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void _passwordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }
}
