import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/verification.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({super.key});

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates the form fields before submission.
  // ignore: unused_element
  bool _verify() {
    String? emailErr;
    String? passwordErr;
    String? confirmPasswordErr;

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty) {
      emailErr = 'Email is required';
    } else if (!_emailRegex.hasMatch(email)) {
      emailErr = 'Please enter a valid email address';
    }

    if (password.isEmpty) {
      passwordErr = 'Password is required';
    } else if (password.length < 8) {
      passwordErr = 'Password must be at least 8 characters';
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordErr = 'Please confirm your password';
    } else if (confirmPassword != password) {
      confirmPasswordErr = 'Passwords do not match';
    }

    setState(() {
      _emailError = emailErr;
      _passwordError = passwordErr;
      _confirmPasswordError = confirmPasswordErr;
    });

    return emailErr == null && passwordErr == null && confirmPasswordErr == null;
  }

  void onSubmit() async {
    Get.to(() => Verification(email: _emailController.text.trim()));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      "Secure Your Access",
                      textAlign: TextAlign.center,
                      style: AppTexts.dsmm,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Enter your personal email address to use for future logins. This will be your primary way to access your account.",
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
                      hintText: "Create a password",
                      leading: "assets/icons/lock.svg",
                      isPassword: true,
                      controller: _passwordController,
                      errorText: _passwordError,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      title: "Confirm Password",
                      hintText: "Re-enter your password",
                      leading: "assets/icons/lock.svg",
                      isPassword: true,
                      controller: _confirmPasswordController,
                      errorText: _confirmPasswordError,
                    ),
                    Spacer(),
                    CustomButton(
                      onTap: onSubmit,
                      text: "Send Verification Code",
                    ),
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
