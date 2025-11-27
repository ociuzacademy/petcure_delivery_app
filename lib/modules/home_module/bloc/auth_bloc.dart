import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/core/localstorage/auth_storage_functions.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<_LoggingOut>(_onLoggingOut);
  }

  Future<void> _onLoggingOut(_LoggingOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      await AuthStorageFunctions.logout();

      emit(const AuthState.logoutSuccess());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
