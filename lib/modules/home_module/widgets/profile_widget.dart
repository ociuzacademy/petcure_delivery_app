// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/core/cubit/delivery_agent_profile_cubit.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/home_module/utils/profile_widget_helper.dart';

import 'package:petcure_delivery_app/modules/home_module/widgets/profile_info_row.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/view/update_profile_page.dart';
import 'package:petcure_delivery_app/widgets/custom_error_widget.dart';
import 'package:petcure_delivery_app/widgets/loaders/custom_loading_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late final ProfileWidgetHelper _profileWidgetHelper;

  @override
  void initState() {
    super.initState();
    _profileWidgetHelper = ProfileWidgetHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileWidgetHelper.profileDataInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<DeliveryAgentProfileCubit, DeliveryAgentProfileState>(
      builder: (context, state) {
        switch (state) {
          case DeliveryAgentProfileLoading _:
            return const CustomLoadingWidget(
              message: 'Loading delivery agent profile data',
            );
          case DeliveryAgentProfileError(:final errorMessage):
            return CustomErrorWidget(
              onRetry: _profileWidgetHelper.profileDataInit,
              errorMessage: errorMessage,
            );
          case DeliveryAgentProfileSuccess(:final agentProfileData):
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.01,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.05,
                    vertical: screenSize.height * 0.05,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${AppUrls.baseUrl}${agentProfileData.profileImage}',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (
                                      context,
                                      url,
                                      progress,
                                    ) => CircularProgressIndicator(
                                      value: progress.progress,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                            AppPalette.firstColor,
                                          ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@${agentProfileData.username}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Contact Information Section
                        const Text(
                          'Contact Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 12),

                        ProfileInfoRow(
                          icon: Icons.location_on,
                          iconColor: Colors.red,
                          label: 'Address:',
                          value: agentProfileData.address,
                        ),

                        const SizedBox(height: 8),

                        ProfileInfoRow(
                          icon: Icons.location_on,
                          iconColor: Colors.red,
                          label: 'Place:',
                          value: agentProfileData.placeDisplay,
                        ),

                        const SizedBox(height: 8),

                        ProfileInfoRow(
                          icon: Icons.phone,
                          iconColor: Colors.green,
                          label: 'Mobile:',
                          value: agentProfileData.phone,
                        ),

                        const SizedBox(height: 8),

                        ProfileInfoRow(
                          icon: Icons.email,
                          iconColor: Colors.orange,
                          label: 'Email:',
                          value: agentProfileData.email,
                        ),

                        const SizedBox(height: 20),

                        // ID Card
                        const Text(
                          'ID Card',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey[400]!,
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppUrls.baseUrl}${agentProfileData.idCardImage}',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      CircularProgressIndicator(
                                        value: progress.progress,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                              AppPalette.firstColor,
                                            ),
                                      ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    UpdateProfilePage.route(),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  side: const BorderSide(
                                    color: AppPalette.firstColor,
                                  ),
                                  backgroundColor: AppPalette.firstColor,
                                  foregroundColor: Colors.white,
                                ),
                                icon: const Icon(Icons.update),
                                label: const Text('Update Profile'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
