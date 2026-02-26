import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/models/place_model.dart';
import 'package:petcure_delivery_app/widgets/custom_error_widget.dart';
import 'package:petcure_delivery_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_delivery_app/widgets/labelled_dropdown.dart';
import 'package:provider/provider.dart';

import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/home_module/view/home_page.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/providers/update_profile_provider.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/utils/update_profile_helper.dart';
import 'package:petcure_delivery_app/widgets/buttons/custom_button.dart';
import 'package:petcure_delivery_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:petcure_delivery_app/widgets/text_fields/custom_text_field.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const UpdateProfilePage());
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late final UpdateProfileHelper _updateProfileHelper;

  @override
  void initState() {
    super.initState();
    _updateProfileHelper = UpdateProfileHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateProfileHelper.agentProfileInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => UpdateProfileProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Profile'),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppPalette.firstColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Consumer<UpdateProfileProvider>(
          builder: (context, provider, child) {
            return MultiBlocListener(
              listeners: [
                BlocListener<
                  DeliveryAgentProfileCubit,
                  DeliveryAgentProfileState
                >(
                  listener: (context, state) {
                    switch (state) {
                      case DeliveryAgentProfileSuccess(:final agentProfileData):
                        provider.setProfileDataFromApi(agentProfileData);
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<UpdateProfileBloc, UpdateProfileState>(
                  listener: (context, state) {
                    switch (state) {
                      case UpdateProfileLoading _:
                        OverlayLoader.show(
                          context,
                          message: 'Updating delivery agent profile',
                        );
                        break;
                      case UpdateProfileError(:final errorMessage):
                        OverlayLoader.hide();
                        CustomSnackBar.showError(
                          context,
                          message: errorMessage,
                        );
                        break;
                      case UpdateProfileSuccess(:final response):
                        OverlayLoader.hide();
                        CustomSnackBar.showSuccess(
                          context,
                          message: response.details,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          HomePage.route(),
                          (_) => false,
                        );
                        break;
                      default:
                        OverlayLoader.hide();
                        break;
                    }
                  },
                  child: Container(),
                ),
              ],
              child: BlocBuilder<DeliveryAgentProfileCubit, DeliveryAgentProfileState>(
                builder: (context, state) {
                  return switch (state) {
                    DeliveryAgentProfileLoading _ => const CustomLoadingWidget(
                      message: 'Fetching delivery agent profile data...',
                    ),
                    DeliveryAgentProfileInitial _ => const CustomLoadingWidget(
                      message: 'Fetching delivery agent profile data...',
                    ),
                    DeliveryAgentProfileError(:final errorMessage) =>
                      CustomErrorWidget(
                        onRetry: _updateProfileHelper.agentProfileInit,
                        errorMessage: errorMessage,
                      ),
                    DeliveryAgentProfileSuccess _ => SafeArea(
                      child: Form(
                        key: provider.formKey,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05,
                              vertical: screenSize.height * 0.05,
                            ),
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenSize.width * 0.85,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Profile Picture Upload
                                    InkWell(
                                      onTap: () =>
                                          provider.pickImage(isIdCard: false),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.grey[300],
                                        backgroundImage: _updateProfileHelper
                                            .getProfileImage(provider),
                                        child: provider.profileImage == null
                                            ? const Icon(
                                                Icons.camera_alt,
                                                size: 40,
                                                color: Colors.black54,
                                              )
                                            : null,
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.usernameController,
                                      validatorFunction:
                                          provider.validateFullName,
                                      labelText: 'Username',
                                      hintText: 'Enter your username',
                                      textFieldIcon: const Icon(Icons.person),
                                      focusNode: provider.fullNameFocusNode,
                                      nextFocusNode: provider.emailFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.emailController,
                                      validatorFunction: provider.validateEmail,
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                      textFieldIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      textInputType: TextInputType.emailAddress,
                                      focusNode: provider.emailFocusNode,
                                      nextFocusNode:
                                          provider.phoneNumberFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.phoneNumberController,
                                      validatorFunction:
                                          provider.validatePhoneNumber,
                                      labelText: 'Phone Number',
                                      hintText: 'Enter your phone number',
                                      textInputType: TextInputType.phone,
                                      textFieldIcon: const Icon(Icons.phone),
                                      focusNode: provider.phoneNumberFocusNode,
                                      nextFocusNode: provider.addressFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),
                                    CustomTextField(
                                      textEditingController:
                                          provider.addressController,
                                      validatorFunction:
                                          provider.validateAddress,
                                      labelText: 'Address',
                                      hintText: 'Enter your address',
                                      textFieldIcon: const Icon(Icons.home),
                                      isMultiline: true,
                                      focusNode: provider.addressFocusNode,
                                      nextFocusNode: provider.passwordFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    LabelledDropdown<PlaceModel>(
                                      value: provider.selectedPlace,
                                      items: provider.places,
                                      labelText: 'Select Place',
                                      hintText: 'Select your place',
                                      prefixIcon: const Icon(
                                        Icons.location_on_outlined,
                                      ),
                                      validator: provider.validatePlace,
                                      onChanged: (PlaceModel? value) {
                                        provider.setSelectedPlace(value);
                                      },
                                      itemLabelBuilder: (PlaceModel place) =>
                                          place.displayName,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    CustomTextField(
                                      textEditingController:
                                          provider.passwordController,
                                      validatorFunction:
                                          provider.validatePassword,
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      textFieldIcon: const Icon(Icons.password),
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      isPassword: true,
                                      focusNode: provider.passwordFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // ID Card Picture Section
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(Icons.credit_card, size: 20),
                                              SizedBox(width: 8),
                                              Text(
                                                'ID Card Picture',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.015,
                                          ),
                                          Text(
                                            'Upload a clear photo of your government-issued ID card',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.015,
                                          ),
                                          InkWell(
                                            onTap: () => provider.pickImage(
                                              isIdCard: true,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[50],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.grey[300]!,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Icon(
                                                        Icons.credit_card,
                                                        size: 20,
                                                      ),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        'ID Card Picture',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenSize.height *
                                                        0.015,
                                                  ),
                                                  Text(
                                                    'Upload a clear photo of your government-issued ID card',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenSize.height *
                                                        0.015,
                                                  ),
                                                  InkWell(
                                                    onTap: () =>
                                                        provider.pickImage(
                                                          isIdCard: true,
                                                        ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        border: Border.all(
                                                          color:
                                                              Colors.grey[400]!,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child:
                                                          _updateProfileHelper
                                                                  .getIdCardImage(
                                                                    provider,
                                                                  ) !=
                                                              null
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                              child: Image(
                                                                image: _updateProfileHelper
                                                                    .getIdCardImage(
                                                                      provider,
                                                                    )!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )
                                                          : Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .credit_card,
                                                                  size: 50,
                                                                  color: Colors
                                                                      .grey[500],
                                                                ),
                                                                const SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  'Tap to upload ID Card',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .grey[600],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),
                                                                Text(
                                                                  'PNG, JPG up to 5MB',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey[500],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    CustomButton(
                                      buttonWidth: double.infinity,
                                      backgroundColor: AppPalette.firstColor,
                                      textColor: Colors.white,
                                      labelText: 'Register',
                                      onClick: () => _updateProfileHelper
                                          .updateProfile(provider),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  };
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
