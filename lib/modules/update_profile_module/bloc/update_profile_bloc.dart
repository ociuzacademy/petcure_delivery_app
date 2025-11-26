import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/classes/update_agent_profile_data.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/models/update_profile_response_model.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/services/update_profile_services.dart';

part 'update_profile_bloc.freezed.dart';
part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(const UpdateProfileInitial()) {
    on<_UpdatingDeliveryAgentProfile>(_onUpdatingDeliveryAgentProfile);
  }

  Future<void> _onUpdatingDeliveryAgentProfile(
    _UpdatingDeliveryAgentProfile event,
    Emitter<UpdateProfileState> emit,
  ) async {
    emit(const UpdateProfileState.updateProfileLoading());
    try {
      final int agentId = await AuthStorageFunctions.getAgentId();

      final UpdateProfileResponseModel response =
          await UpdateProfileServices.updateDeliveryAgentProfile(
            agentId: agentId,
            updateAgentProfileData: event.updatedProfileData,
          );

      emit(UpdateProfileState.updateProfileSuccess(response));
    } catch (e) {
      emit(UpdateProfileState.updateProfileError(e.toString()));
    }
  }
}
