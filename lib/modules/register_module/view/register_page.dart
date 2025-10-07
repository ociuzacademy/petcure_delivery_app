import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/login_module/view/login_page.dart';
import 'package:petcure_delivery_app/modules/register_module/utils/register_helper.dart';
import 'package:petcure_delivery_app/widgets/buttons/custom_button.dart';
import 'package:petcure_delivery_app/widgets/text_fields/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static route() => MaterialPageRoute(builder: (context) => RegisterPage());
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterHelper _registerHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  final ValueNotifier<File?> _profileImage = ValueNotifier(null);
  final ValueNotifier<File?> _idCardImage = ValueNotifier(null);
  final ValueNotifier<String?> _selectedCity = ValueNotifier(
    null,
  ); // NEW: Selected city

  // List of available cities
  static const List<String> _cities = ['Thrissur', 'Palakkad', 'Ernakulam'];

  @override
  void initState() {
    super.initState();
    _registerHelper = RegisterHelper(
      context: context,
      formKey: _formKey,
      fullNameController: _fullNameController,
      emailController: _emailController,
      phoneNumberController: _phoneNumberController,
      passwordController: _passwordController,
      addressController: _addressController,
      profileImage: _profileImage,
      idCardImage: _idCardImage,
      selectedCity: _selectedCity, // NEW: Pass selected city to helper
    );
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _profileImage.dispose();
    _idCardImage.dispose();
    _selectedCity.dispose(); // NEW: Dispose selected city

    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.05,
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenSize.width * 0.85),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Picture Upload
                    ValueListenableBuilder(
                      valueListenable: _profileImage,
                      builder: (context, profileImage, child) => InkWell(
                        onTap: () => _registerHelper.pickImage(isIdCard: false),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: profileImage != null
                              ? FileImage(profileImage)
                              : null,
                          child: profileImage == null
                              ? const Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: Colors.black54,
                                )
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomTextField(
                      textEditingController: _fullNameController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      textFieldIcon: const Icon(Icons.person),
                      focusNode: _fullNameFocusNode,
                      nextFocusNode: _emailFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomTextField(
                      textEditingController: _emailController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }

                        bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      textFieldIcon: const Icon(Icons.email_outlined),
                      textInputType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _phoneNumberFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomTextField(
                      textEditingController: _phoneNumberController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }

                        bool phoneValid = RegExp(
                          r'^(\+91[\-\s]?)?[6-9]\d{9}$',
                        ).hasMatch(value);
                        if (!phoneValid) {
                          return 'Please enter a valid phone number';
                        }

                        return null;
                      },
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      textInputType: TextInputType.phone,
                      textFieldIcon: const Icon(Icons.phone),
                      focusNode: _phoneNumberFocusNode,
                      nextFocusNode: _addressFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomTextField(
                      textEditingController: _addressController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add your address';
                        }
                        return null;
                      },
                      labelText: "Address",
                      hintText: "Enter your address",
                      textFieldIcon: const Icon(Icons.home),
                      isMultiline: true,
                      focusNode: _addressFocusNode,
                      nextFocusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // City Selection Section - REPLACED Location with City Dropdown
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
                    ValueListenableBuilder(
                      valueListenable: _selectedCity,
                      builder: (context, selectedCity, child) => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedCity,
                              isExpanded: true,
                              hint: const Text('Select your city'),
                              icon: const Icon(Icons.arrow_drop_down),
                              items: _cities.map((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                _selectedCity.value = newValue;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    CustomTextField(
                      textEditingController: _passwordController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      textFieldIcon: const Icon(Icons.password),
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      focusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // ID Card Picture Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!, width: 1),
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
                          ValueListenableBuilder(
                            valueListenable: _idCardImage,
                            builder: (context, idCardImage, child) => InkWell(
                              onTap: () =>
                                  _registerHelper.pickImage(isIdCard: true),
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
                                child: idCardImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.file(
                                          idCardImage,
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
                                          SizedBox(height: 8),
                                          Text(
                                            'Tap to upload ID Card',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 4),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: Colors.white,
                      labelText: "Register",
                      onClick: _registerHelper.register,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        InkWell(
          onTap: () => Navigator.pushReplacement(context, LoginPage.route()),
          child: Text(
            "Login Account",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPalette.firstColor,
            ),
          ),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}
