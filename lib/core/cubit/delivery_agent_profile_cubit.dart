import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/core/localstorage/auth_storage_functions.dart';

import 'package:petcure_delivery_app/core/models/api_models/delivery_agent_profile_model.dart';
import 'package:petcure_delivery_app/core/services/app_services.dart';

part 'delivery_agent_profile_cubit.freezed.dart';
part 'delivery_agent_profile_state.dart';

class DeliveryAgentProfileCubit extends Cubit<DeliveryAgentProfileState> {
  DeliveryAgentProfileCubit()
    : super(const DeliveryAgentProfileState.initial());

  Future<void> getDeliveryAgentProfileDetails() async {
    emit(const DeliveryAgentProfileState.deliveryAgentProfileLoading());
    try {
      final int agentId = await AuthStorageFunctions.getAgentId();

      final DeliveryAgentProfileModel agentProfileData =
          await AppServices.getUserProfileData(agentId: agentId);

      emit(
        DeliveryAgentProfileState.deliveryAgentProfileSuccess(agentProfileData),
      );
    } catch (e) {
      emit(DeliveryAgentProfileState.deliveryAgentProfileError(e.toString()));
    }
  }
}
