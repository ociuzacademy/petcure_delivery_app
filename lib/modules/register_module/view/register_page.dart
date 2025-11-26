import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/modules/register_module/utils/register_helper.dart';
import 'package:petcure_delivery_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/login_module/view/login_page.dart';
import 'package:petcure_delivery_app/modules/register_module/providers/register_provider.dart';
import 'package:petcure_delivery_app/widgets/buttons/custom_button.dart';
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
                              onTap: () => provider.pickImage(isIdCard: false),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: provider.profileImage != null
                                    ? FileImage(provider.profileImage!)
                                    : null,
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
                              validatorFunction: provider.validateFullName,
                              labelText: 'Username',
                              hintText: 'Enter your username',
                              textFieldIcon: const Icon(Icons.person),
                              focusNode: provider.fullNameFocusNode,
                              nextFocusNode: provider.emailFocusNode,
                            ),
                            SizedBox(height: screenSize.height * 0.025),
                            CustomTextField(
                              textEditingController: provider.emailController,
                              validatorFunction: provider.validateEmail,
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              textFieldIcon: const Icon(Icons.email_outlined),
                              textInputType: TextInputType.emailAddress,
                              focusNode: provider.emailFocusNode,
                              nextFocusNode: provider.phoneNumberFocusNode,
                            ),
                            SizedBox(height: screenSize.height * 0.025),
                            CustomTextField(
                              textEditingController:
                                  provider.phoneNumberController,
                              validatorFunction: provider.validatePhoneNumber,
                              labelText: 'Phone Number',
                              hintText: 'Enter your phone number',
                              textInputType: TextInputType.phone,
                              textFieldIcon: const Icon(Icons.phone),
                              focusNode: provider.phoneNumberFocusNode,
                              nextFocusNode: provider.addressFocusNode,
                            ),
                            SizedBox(height: screenSize.height * 0.025),
                            CustomTextField(
                              textEditingController: provider.addressController,
                              validatorFunction: provider.validateAddress,
                              labelText: 'Address',
                              hintText: 'Enter your address',
                              textFieldIcon: const Icon(Icons.home),
                              isMultiline: true,
                              focusNode: provider.addressFocusNode,
                              nextFocusNode: provider.passwordFocusNode,
                            ),
                            SizedBox(height: screenSize.height * 0.025),

                            // City Selection Section
                            const Row(
                              children: [
                                Icon(Icons.location_city, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Select City',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenSize.height * 0.015),

                            // City Dropdown
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: provider.selectedCity,
                                    isExpanded: true,
                                    hint: const Text('Select your city'),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: provider.availableCities.map((
                                      String city,
                                    ) {
                                      return DropdownMenuItem<String>(
                                        value: city,
                                        child: Text(city),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      provider.setSelectedCity(newValue);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.025),

                            CustomTextField(
                              textEditingController:
                                  provider.passwordController,
                              validatorFunction: provider.validatePassword,
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              textFieldIcon: const Icon(Icons.password),
                              textInputType: TextInputType.visiblePassword,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(height: screenSize.height * 0.015),
                                  Text(
                                    'Upload a clear photo of your government-issued ID card',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  InkWell(
                                    onTap: () =>
                                        provider.pickImage(isIdCard: true),
                                    child: Container(
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
                                      child: provider.idCardImage != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.file(
                                                provider.idCardImage!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.credit_card,
                                                  size: 50,
                                                  color: Colors.grey[500],
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Tap to upload ID Card',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  'PNG, JPG up to 5MB',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[500],
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
                              onClick: () => _registerHelper.register(provider),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        persistentFooterButtons: [
          InkWell(
            onTap: () => Navigator.pushReplacement(context, LoginPage.route()),
            child: const Text(
              'Login Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppPalette.firstColor,
              ),
            ),
          ),
        ],
        persistentFooterAlignment: AlignmentDirectional.center,
      ),
    );
  }
}
