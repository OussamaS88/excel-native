import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:excel_native/services/auth/auth_service.dart';
import 'package:excel_native/services/auth/auth_user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthService _authService;
  late final StreamSubscription<AuthUser> _userSubscription;
  AppBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(authService.currentUser != AuthUser.empty
            ? AppState.authenticated(authService.currentUser!)
            : const AppState.unauthenticated()) {
    on<AppLogoutRequested>(_appLogOutRequested);
    on<AppUserChanged>(_appUserChanged);
    _userSubscription = _authService.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  void _appLogOutRequested(
      AppLogoutRequested event, Emitter<AppState> emit) async {
    await _authService.logOut();
  }

  void _appUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    if (event.user.isEmpty) {
      print("empty");
      // _cacheClient.write(key: 'cache_user_id', value: AuthUser.empty);
      emit(const AppState.unauthenticated());
    } else {
      print(event.user.toString());
      // _cacheClient.write(key: 'cache_user_id', value: event.user);
      emit(AppState.authenticated(event.user));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
