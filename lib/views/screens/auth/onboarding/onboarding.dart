import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/onboarding/role_selection.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  void onSubmit() async {
    Get.to(() => RoleSelection());
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    const SizedBox(height: 62),
                    Logo(),
                    const SizedBox(height: 32),
                    Text(
                      "Join the CrewNest Community",
                      style: AppTexts.dsmm,
                      textAlign: .center,
                    ),
                    const SizedBox(height: 40),
                    features(
                      "airline_verification",
                      "Airline Verification",
                      "Securely verify your employment with industry-standard protocols.",
                    ),
                    const SizedBox(height: 12),
                    features(
                      "secure_booking",
                      "Secure Booking",
                      "Book with confidence through our vetted listings designed for aviation lifestyles.",
                    ),
                    const SizedBox(height: 12),
                    features(
                      "verified_community",
                      "Verified Community",
                      "Connect with thousands of fellow crew members in a safe, professional space.",
                    ),
                    Spacer(),
                    CustomButton(onTap: onSubmit, text: "Continue"),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "By continuing, you agree to our ",
                        style: AppTexts.tsmr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms of Service",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint("Terms of Service tapped");
                              },
                            style: AppTexts.tmdm.copyWith(
                              color: AppColors.blue,
                              decoration: .underline,
                            ),
                          ),
                        ],
                      ),
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

  Widget features(String iconName, String title, String description) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: .all(16),
        decoration: BoxDecoration(
          color: Color(0xffF0F1F3),
          borderRadius: .circular(24),
        ),
        child: Row(
          spacing: 16,
          crossAxisAlignment: .start,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
              child: Center(
                child: CustomSvg(asset: "assets/icons/$iconName.svg", size: 32),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(title, style: AppTexts.txlm),
                  Text(
                    description,
                    style: AppTexts.tsmr.copyWith(
                      color: AppColors.black.shade200,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
