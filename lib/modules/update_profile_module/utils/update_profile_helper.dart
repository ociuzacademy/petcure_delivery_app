// update_profile_helper.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/classes/update_agent_profile_data.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/providers/update_profile_provider.dart';

class UpdateProfileHelper {
  final BuildContext context;
  const UpdateProfileHelper({required this.context});

  void agentProfileInit() {
    final DeliveryAgentProfileCubit deliveryAgentProfileCubit = context
        .read<DeliveryAgentProfileCubit>();
    deliveryAgentProfileCubit.getDeliveryAgentProfileDetails();
  }

  ImageProvider? getProfileImage(UpdateProfileProvider provider) {
    if (provider.profileImage != null) {
      return FileImage(provider.profileImage!);
    } else if (provider.agentProfile != null) {
      return CachedNetworkImageProvider(
        '${AppUrls.baseUrl}${provider.agentProfile!.profileImage}',
      );
    } else {
      return const CachedNetworkImageProvider('https://i.pravatar.cc/300');
    }
  }

  ImageProvider? getIdCardImage(UpdateProfileProvider provider) {
    if (provider.idCardImage != null) {
      // Fixed: changed profileImage to idCardImage
      return FileImage(provider.idCardImage!);
    } else if (provider.agentProfile != null) {
      return CachedNetworkImageProvider(
        '${AppUrls.baseUrl}${provider.agentProfile!.idCardImage}',
      );
    } else {
      return null; // Return null to show the placeholder UI
    }
  }

  void updateProfile(UpdateProfileProvider provider) {
    final UpdateAgentProfileData? updatedProfileData = provider
        .validateUpdateProfileData();

    if (updatedProfileData != null) {
      final UpdateProfileBloc updateProfileBloc = context
          .read<UpdateProfileBloc>();
      updateProfileBloc.add(
        UpdateProfileEvent.updatingDeliveryAgentProfile(updatedProfileData),
      );
    }
  }
}
