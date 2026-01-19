import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/home_module/view/home_page.dart';
import 'package:petcure_delivery_app/modules/login_module/utils/login_helper.dart';
import 'package:petcure_delivery_app/modules/register_module/view/register_page.dart';
import 'package:petcure_delivery_app/core/utils/validators.dart';
import 'package:petcure_delivery_app/widgets/buttons/custom_button.dart';
import 'package:petcure_delivery_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:petcure_delivery_app/widgets/text_fields/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());
}

class _LoginPageState extends State<LoginPage> {
  late final LoginHelper _loginHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginHelper = LoginHelper(
      context: context,
      formKey: _formKey,
      emailController: _emailController,
      passwordController: _passwordController,
    );
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoading _:
              OverlayLoader.show(
                context,
                message: 'Delivery agent logging in...',
              );
              break;
            case LoginError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            case LoginSuccess _:
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(
                context,
                message: 'Delivery agent logged in...',
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
        child: SafeArea(
          child: Stack(
            children: [
              // Background Gradient Header
              Container(
                height: screenSize.height * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppPalette.firstColor, AppPalette.secondColor],
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
                      horizontal: screenSize.width * 0.07,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: screenSize.height * 0.08),
                        // Logo/Icon with Shadow
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: AppPalette.firstColor,
                              backgroundImage: AssetImage(
                                'assets/icons/icon.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.04),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Login to your delivery partner account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.05),
                        // Login Card
                        Card(
                          elevation: 10,
                          shadowColor: Colors.black.withValues(alpha: 0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    textEditingController: _emailController,
                                    validatorFunction: Validators.email,
                                    labelText: 'Email',
                                    hintText: 'Enter your email',
                                    textFieldIcon: const Icon(
                                      Icons.email_outlined,
                                    ),
                                    textInputType: TextInputType.emailAddress,
                                    focusNode: _emailFocusNode,
                                    nextFocusNode: _passwordFocusNode,
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    textEditingController: _passwordController,
                                    validatorFunction: Validators.password,
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    textFieldIcon: const Icon(
                                      Icons.lock_outline,
                                    ),
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    isPassword: true,
                                    focusNode: _passwordFocusNode,
                                  ),
                                  const SizedBox(height: 30),
                                  CustomButton(
                                    buttonWidth: double.infinity,
                                    backgroundColor: AppPalette.firstColor,
                                    textColor: AppPalette.whiteColor,
                                    labelText: 'Login',
                                    onClick: _loginHelper.login,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                RegisterPage.route(),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppPalette.firstColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
