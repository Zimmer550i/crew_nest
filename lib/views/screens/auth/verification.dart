import 'dart:async';

import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/login.dart';
import 'package:crew_nest/views/screens/auth/onboarding/welcome_screen.dart';
import 'package:crew_nest/views/screens/auth/success_screen.dart';
import 'package:crew_nest/views/screens/auth/verify_employment.dart';
import 'package:crew_nest/views/screens/common/edit_personal_information.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  final String email;
  final bool isResettingPassword;
  final bool isVerifyingEmployment;
  const Verification({
    super.key,
    required this.email,
    this.isResettingPassword = false,
    this.isVerifyingEmployment = false,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool canResend = false;
  int timeoutInSec = 5;
  int seconds = 5;
  Timer? _timer;
  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// Validates the OTP input before submission.
  // ignore: unused_element
  bool _verify() {
    final pin = pinController.text.trim();

    if (pin.isEmpty) {
      Get.snackbar(
        'OTP Required',
        'Please enter the 6-digit verification code',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (pin.length != 6) {
      Get.snackbar(
        'Invalid OTP',
        'Please enter all 6 digits',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (!RegExp(r'^\d{6}$').hasMatch(pin)) {
      Get.snackbar(
        'Invalid OTP',
        'OTP must contain only numbers',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }

  void onSubmit() async {
    if (widget.isResettingPassword) {
      Get.to(
        () => SuccessScreen(
          title: "Password Changed Successfully",
          onSubmit: () {
            Get.offAll(() => WelcomeScreen());
            Get.to(() => Login());
          },
        ),
      );
    } else if (widget.isVerifyingEmployment) {
      Get.to(
        () => SuccessScreen(
          title: "Employment Verified",
          details:
              "Your status in the elite aviation network has been confirmed. You can now proceed to complete your CrewNest account and unlock exclusive member benefits.",
          onSubmit: () {
            Get.offAll(() => WelcomeScreen());
            Get.to(() => EditPersonalInformation());
          },
        ),
      );
    } else {
      Get.to(
        () => SuccessScreen(
          title: "Account Created",
          details:
              "You can now proceed to complete your CrewNest account and unlock exclusive member benefits.",
          onSubmit: () {
            Get.offAll(() => WelcomeScreen());
            Get.to(() => VerifyEmployment());
          },
        ),
      );
    }
  }

  void resendCode() async {
    startTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: .expand,
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
              padding: .symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 42),
                    Spacer(),
                    CustomSvg(asset: "assets/icons/verification.svg"),
                    const SizedBox(height: 50),
                    Text(
                      "One More Step",
                      textAlign: .center,
                      style: AppTexts.dsmm,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "A 6-digit OTP code has been sent to",
                        textAlign: .center,
                        style: AppTexts.tmdr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.email,
                        textAlign: TextAlign.center,
                        style: AppTexts.tmdb.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Pinput(
                      length: 6,
                      controller: pinController,
                      cursor: Container(
                        height: 24,
                        width: 1.5,
                        color: AppColors.blue,
                      ),
                      defaultPinTheme: PinTheme(
                        height: 56,
                        width: 56,
                        textStyle: AppTexts.txlm,
                        decoration: BoxDecoration(
                          color: Color(0xffF0F1F3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (canResend)
                      Center(
                        child: GestureDetector(
                          onTap: resendCode,
                          child: Text(
                            "Resend Code",
                            style: AppTexts.tsmm.copyWith(
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ),
                    if (!canResend)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Resend Code in ",
                            style: AppTexts.tsmr.copyWith(
                              color: AppColors.black.shade400,
                            ),
                          ),
                          Text(
                            "${seconds.toString()}s",
                            style: AppTexts.tsms.copyWith(
                              color: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                    Spacer(),
                    CustomButton(onTap: onSubmit, text: "Verify Now"),
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

  void startTimer() {
    setState(() {
      canResend = false;
      seconds = timeoutInSec;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (val) {
      if (seconds == 0) {
        setState(() {
          canResend = true;
        });
        val.cancel();
      } else {
        setState(() {
          seconds = seconds - 1;
        });
      }
    });
  }
}
