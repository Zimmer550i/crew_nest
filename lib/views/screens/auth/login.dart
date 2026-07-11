import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/forgot_password.dart';
import 'package:crew_nest/views/screens/landlord/landlord_app.dart';
import 'package:crew_nest/views/screens/user/user_app.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:crew_nest/views/widgets/overlay_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates the login form fields before submission.
  // ignore: unused_element
  bool _verify() {
    String? emailErr;
    String? passwordErr;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty) {
      emailErr = 'Email is required';
    } else if (!_emailRegex.hasMatch(email)) {
      emailErr = 'Please enter a valid email address';
    }

    if (password.isEmpty) {
      passwordErr = 'Password is required';
    }

    setState(() {
      _emailError = emailErr;
      _passwordError = passwordErr;
    });

    return emailErr == null && passwordErr == null;
  }

  void onSubmit() async {
    showDialog(
      context: context,
      builder: (ctx) {
        return OverlayConfirmation(
          title: "Who are you?",
          buttonTextLeft: "Renter",
          buttonCallBackLeft: () {
            Get.to(() => UserApp());
          },
          buttonTextRight: "Landlord",
          buttonCallBackRight: () {
            Get.to(() => LandlordApp());
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CustomSvg(asset: "assets/icons/vector_design_top.svg"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomSvg(asset: "assets/icons/vector_design_bottom.svg"),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Center(
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CustomSvg(asset: "assets/icons/back.svg", size: 32),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 42),
                    Spacer(),
                    Logo(size: 100),
                    const SizedBox(height: 50),
                    Text(
                      "Log In",
                      textAlign: TextAlign.center,
                      style: AppTexts.dsmm,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Sign in with your personal email address",
                        textAlign: TextAlign.center,
                        style: AppTexts.tmdr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      title: "Email",
                      hintText: "Enter your email",
                      leading: "assets/icons/email.svg",
                      controller: _emailController,
                      errorText: _emailError,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      title: "Password",
                      hintText: "Enter your password",
                      leading: "assets/icons/lock.svg",
                      isPassword: true,
                      controller: _passwordController,
                      errorText: _passwordError,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => ForgotPassword(
                              email: _emailController.text.trim(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppTexts.tsmm.copyWith(color: AppColors.error),
                        ),
                      ),
                    ),
                    Spacer(),
                    CustomButton(onTap: onSubmit, text: "Log In"),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
