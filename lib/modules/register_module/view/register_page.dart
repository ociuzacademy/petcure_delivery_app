import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/modules/register_module/utils/register_helper.dart';
import 'package:petcure_delivery_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:petcure_delivery_app/core/models/place_model.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/login_module/view/login_page.dart';
import 'package:petcure_delivery_app/modules/register_module/providers/register_provider.dart';
import 'package:petcure_delivery_app/widgets/buttons/custom_button.dart';
import 'package:petcure_delivery_app/widgets/labelled_dropdown.dart';
import 'package:petcure_delivery_app/widgets/text_fields/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const RegisterPage());
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterHelper _registerHelper;

  @override
  void initState() {
    super.initState();
    _registerHelper = RegisterHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: Scaffold(
        body: Consumer<RegisterProvider>(
          builder: (context, provider, child) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                switch (state) {
                  case RegisterLoading _:
                    OverlayLoader.show(
                      context,
                      message: 'Registering delivery agent',
                    );
                    break;
                  case RegisterError(:final errorMessage):
                    OverlayLoader.hide();
                    CustomSnackBar.showError(context, message: errorMessage);
                    break;
                  case RegisterSuccess(:final response):
                    OverlayLoader.hide();
                    CustomSnackBar.showSuccess(
                      context,
                      message: response.message,
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      LoginPage.route(),
                      (_) => false,
                    );
                    break;
                  default:
                    OverlayLoader.hide();
                    break;
                }
              },
              child: SafeArea(
                child: Stack(
                  children: [
                    // Background Gradient Header
                    Container(
                      height: screenSize.height * 0.3,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppPalette.firstColor,
                            AppPalette.secondColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.05,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: screenSize.height * 0.04),
                              Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Join our delivery partner network',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.03),
                              // Profile Picture Upload
                              GestureDetector(
                                onTap: () =>
                                    provider.pickImage(isIdCard: false),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 4,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.1,
                                            ),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.grey[200],
                                        backgroundImage:
                                            provider.profileImage != null
                                            ? FileImage(provider.profileImage!)
                                            : null,
                                        child: provider.profileImage == null
                                            ? Icon(
                                                Icons.person,
                                                size: 60,
                                                color: Colors.grey[400],
                                              )
                                            : null,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: AppPalette.firstColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.03),
                              // Registration Form Card
                              Card(
                                elevation: 10,
                                shadowColor: Colors.black.withValues(
                                  alpha: 0.1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Form(
                                    key: provider.formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextField(
                                          textEditingController:
                                              provider.usernameController,
                                          validatorFunction:
                                              provider.validateFullName,
                                          labelText: 'Username',
                                          hintText: 'Enter your username',
                                          textFieldIcon: const Icon(
                                            Icons.person,
                                          ),
                                          focusNode: provider.fullNameFocusNode,
                                          nextFocusNode:
                                              provider.emailFocusNode,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          textEditingController:
                                              provider.emailController,
                                          validatorFunction:
                                              provider.validateEmail,
                                          labelText: 'Email',
                                          hintText: 'Enter your email',
                                          textFieldIcon: const Icon(
                                            Icons.email_outlined,
                                          ),
                                          textInputType:
                                              TextInputType.emailAddress,
                                          focusNode: provider.emailFocusNode,
                                          nextFocusNode:
                                              provider.phoneNumberFocusNode,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          textEditingController:
                                              provider.phoneNumberController,
                                          validatorFunction:
                                              provider.validatePhoneNumber,
                                          labelText: 'Phone Number',
                                          hintText: 'Enter your phone number',
                                          textInputType: TextInputType.phone,
                                          textFieldIcon: const Icon(
                                            Icons.phone,
                                          ),
                                          focusNode:
                                              provider.phoneNumberFocusNode,
                                          nextFocusNode:
                                              provider.addressFocusNode,
                                        ),
                                        const SizedBox(height: 16),
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
                                          nextFocusNode:
                                              provider.passwordFocusNode,
                                        ),
                                        const SizedBox(height: 16),
                                        // Place Dropdown
                                        LabelledDropdown<PlaceModel>(
                                          value: provider.selectedPlace,
                                          items: provider.places,
                                          labelText: 'Select Place',
                                          hintText: 'Select your place',
                                          prefixIcon: const Icon(
                                            Icons.location_on_outlined,
                                          ),
                                          validator: provider.validatePlace,
                                          onChanged: provider.setSelectedPlace,
                                          itemLabelBuilder:
                                              (PlaceModel place) =>
                                                  place.displayName,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextField(
                                          textEditingController:
                                              provider.passwordController,
                                          validatorFunction:
                                              provider.validatePassword,
                                          labelText: 'Password',
                                          hintText: 'Enter your password',
                                          textFieldIcon: const Icon(
                                            Icons.lock_outline,
                                          ),
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          isPassword: true,
                                          focusNode: provider.passwordFocusNode,
                                        ),
                                        const SizedBox(height: 24),
                                        // ID Card Section
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey[300]!,
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
                                                    color:
                                                        AppPalette.firstColor,
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
                                              const SizedBox(height: 12),
                                              GestureDetector(
                                                onTap: () => provider.pickImage(
                                                  isIdCard: true,
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    border: Border.all(
                                                      color: Colors.grey[300]!,
                                                      style: BorderStyle.solid,
                                                    ),
                                                  ),
                                                  child:
                                                      provider.idCardImage !=
                                                          null
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                          child: Image.file(
                                                            provider
                                                                .idCardImage!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .add_a_photo_outlined,
                                                              size: 40,
                                                              color: Colors
                                                                  .grey[400],
                                                            ),
                                                            const SizedBox(
                                                              height: 12,
                                                            ),
                                                            Text(
                                                              'Upload ID Card photo',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 32),
                                        CustomButton(
                                          buttonWidth: double.infinity,
                                          backgroundColor:
                                              AppPalette.firstColor,
                                          textColor: Colors.white,
                                          labelText: 'Create Account',
                                          onClick: () => _registerHelper
                                              .register(provider),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.04),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account? ',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pushReplacement(
                                      context,
                                      LoginPage.route(),
                                    ),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppPalette.firstColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
