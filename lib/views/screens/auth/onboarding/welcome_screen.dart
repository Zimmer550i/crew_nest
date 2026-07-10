import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/login.dart';
import 'package:crew_nest/views/screens/auth/onboarding/onboarding.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: .min,
                spacing: 20,
                children: [
                  Spacer(flex: 2),
                  Logo(),
                  Text(
                    "Welcome to CrewNest",
                    textAlign: .center,
                    style: AppTexts.dsmm.copyWith(color: AppColors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Secure, verified housing designed exclusively for aviation professionals on the move.",
                      style: AppTexts.tmdr.copyWith(color: AppColors.blue),
                      textAlign: .center,
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    onTap: () => Get.to(() => Onboarding()),
                    text: "Get Started",
                  ),
                  CustomButton(
                    onTap: () => Get.to(() => Login()),
                    text: "Sign In",
                    isSecondary: true,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 3,
            left: 20,
            right: 20,
            child: Column(spacing: 20, children: [
              ],
            ),
          ),
        ],
      ),
    );
  }
}
