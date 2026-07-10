import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String? details;
  final void Function() onSubmit;
  const SuccessScreen({
    super.key,
    required this.title,
    this.details,
    required this.onSubmit,
  });

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
                  mainAxisAlignment: .center,
                  children: [
                    CustomSvg(asset: "assets/icons/success.svg"),
                    const SizedBox(height: 20),
                    Text(title, textAlign: .center, style: AppTexts.dsmm),
                    if (details != null) const SizedBox(height: 12),
                    if (details != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          details!,
                          textAlign: .center,
                          style: AppTexts.tmdr.copyWith(
                            color: AppColors.black.shade300,
                          ),
                        ),
                      ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: SafeArea(
              child: CustomButton(onTap: onSubmit, text: "Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
