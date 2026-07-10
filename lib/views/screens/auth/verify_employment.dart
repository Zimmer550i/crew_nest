import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/verification.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmployment extends StatefulWidget {
  const VerifyEmployment({super.key});

  @override
  State<VerifyEmployment> createState() => _VerifyEmploymentState();
}

class _VerifyEmploymentState extends State<VerifyEmployment> {
  final _emailController = TextEditingController();

  String? _emailError;

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates the employment email before submission.
  // ignore: unused_element
  bool _verify() {
    String? emailErr;

    final email = _emailController.text.trim();

    if (email.isEmpty) {
      emailErr = 'Airline email is required';
    } else if (!_emailRegex.hasMatch(email)) {
      emailErr = 'Please enter a valid email address';
    }

    setState(() {
      _emailError = emailErr;
    });

    return emailErr == null;
  }

  void onSubmit() async {
    Get.to(
      () => Verification(
        email: _emailController.text.trim(),
        isVerifyingEmployment: true,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                      "Verify Your Airline Employment",
                      textAlign: TextAlign.center,
                      style: AppTexts.dsmm,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Secure your status in the elite aviation network.",
                        textAlign: TextAlign.center,
                        style: AppTexts.tmdr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      title: "Email",
                      hintText: "Enter your airline email",
                      leading: "assets/icons/email.svg",
                      controller: _emailController,
                      errorText: _emailError,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(0xfff0f1f3).withValues(alpha: 0.5),
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          Row(
                            spacing: 16,
                            children: [
                              CustomSvg(
                                  asset: "assets/icons/why_verify.svg"),
                              Text("Why Verify?", style: AppTexts.tlgm),
                            ],
                          ),
                          Text(
                            "Verification keeps our community exclusive and safe. By confirming your employment, you gain access to verified crew-only lounges, secure trip swapping, and specialized aviation benefits tailored for professionals.",
                            style: AppTexts.tsmr.copyWith(
                              color: AppColors.black.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
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
