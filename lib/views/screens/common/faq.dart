import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_icons.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/common/contact_support.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "FAQ"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 12,
            children: [
              const SizedBox(height: 8),
              for (int i = 0; i < 10; i++)
                faqWidget(
                  "What is CrewNest",
                  "CrewNest is a trusted accommodation marketplace exclusively for verified airline staff, including cabin crew, pilots, and ground staff.",
                ),
              const SizedBox(height: 50),
              CustomButton(
                onTap: () {
                  Get.to(() => ContactSupport());
                },
                text: "Need Support?",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget faqWidget(String title, String description) {
    final controller = ExpansibleController();
    return Container(
      padding: .symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(16),
      ),
      child: Expansible(
        animationStyle: AnimationStyle(duration: Duration(milliseconds: 100)),
        headerBuilder: (context, animation) {
          return GestureDetector(
            onTap: () {
              controller.toggle();
            },
            child: Row(
              spacing: 12,
              children: [
                Expanded(child: Text(title, style: AppTexts.tmdm)),
                AnimatedBuilder(
                  animation: animation,
                  builder: (ctx, val) {
                    return AnimatedRotation(
                      duration: Duration(milliseconds: 100),
                      turns: 1 - (animation.value * 0.5),
                      child: CustomSvg(
                        asset: AppIcons.arrowDown,
                        size: 24,
                        color: AppColors.black.shade400,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        bodyBuilder: (context, animation) {
          return Container(
            padding: .only(left: 12),
            margin: .only(left: 12, right: 12, top: 12),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: AppColors.black.shade400)),
            ),
            child: Text(
              description,
              style: AppTexts.tsmr.copyWith(color: AppColors.black.shade300),
            ),
          );
        },
        controller: controller,
      ),
    );
  }
}
