import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/auth/account_creation.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  int index = -1;

  void onSubmit() async {
    if (index != -1) {
      Get.to(() => AccountCreation());
    }
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
                    CustomSvg(asset: "assets/icons/role_selection.svg"),
                    Spacer(),
                    Text(
                      "Choose Your Role",
                      textAlign: .center,
                      style: AppTexts.dsmm,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Select how you'd like to use the community.",
                        textAlign: .center,
                        style: AppTexts.tmdr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    features(
                      "airline_verification",
                      "I'm a Renter",
                      "Looking for verified crew-exclusive housing.",
                      pos: 0,
                    ),
                    const SizedBox(height: 12),
                    features(
                      "secure_booking",
                      "I'm a Landlord",
                      "Renting out my space to fellow airline professionals.",
                      pos: 1,
                    ),
                    Spacer(flex: 2),
                    CustomButton(
                      onTap: onSubmit,
                      isDisabled: index == -1,
                      text: "Continue",
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

  Widget features(
    String iconName,
    String title,
    String description, {
    int pos = -1,
  }) {
    bool isSelected = pos == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          index = pos;
        });
      },
      child: Container(
        padding: .all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.success.withValues(alpha: 0.15)
              : Colors.white,
          borderRadius: .circular(24),
          border: Border.all(color: AppColors.black.shade50, width: 0.5),
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
                child: CustomSvg(
                  asset: "assets/icons/$iconName.svg",
                  color: isSelected ? AppColors.success : null,
                  size: 32,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(title, style: AppTexts.txlm),
                      if (isSelected)
                        CustomSvg(asset: "assets/icons/selected.svg"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      description,
                      style: AppTexts.tsmr.copyWith(
                        color: AppColors.black.shade200,
                      ),
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
