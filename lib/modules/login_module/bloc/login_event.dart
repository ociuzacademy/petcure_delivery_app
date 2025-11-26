part of 'login_bloc.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.agentLoggingIn(String email, String password) =
      _AgentLoggingIn;
}
