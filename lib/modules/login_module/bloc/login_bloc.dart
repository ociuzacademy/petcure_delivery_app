import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_delivery_app/modules/login_module/models/delivery_agent_login_response_model.dart';
import 'package:petcure_delivery_app/modules/login_module/services/login_services.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<_AgentLoggingIn>(_onAgentLoggingIn);
  }

  Future<void> _onAgentLoggingIn(
    _AgentLoggingIn event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loginLoading());
    try {
      final DeliveryAgentLoginResponseModel response =
          await LoginServices.deliveryAgentLogin(
            email: event.email,
            password: event.password,
          );

      await AuthStorageFunctions.login(response.id);

      emit(LoginState.loginSuccess(response));
    } catch (e) {
      emit(LoginState.loginError(e.toString()));
    }
  }
}
