import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/modules/register_module/classes/delivery_agent_register_data.dart';
import 'package:petcure_delivery_app/modules/register_module/models/delivery_registration_response_model.dart';
import 'package:petcure_delivery_app/modules/register_module/services/register_services.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    on<_DeliveryAgentRegistering>(_onDeliveryAgentRegistering);
  }

  Future<void> _onDeliveryAgentRegistering(
    _DeliveryAgentRegistering event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState.registerLoading());
    try {
      final DeliveryRegistrationResponseModel response =
          await RegisterServices.registerDeliveryAgent(
            deliveryAgentRegisterData: event.deliveryAgentRegisterData,
          );

      emit(RegisterState.registerSuccess(response));
    } catch (e) {
      emit(RegisterState.registerError(e.toString()));
    }
  }
}
