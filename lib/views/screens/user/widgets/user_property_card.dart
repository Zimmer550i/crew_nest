import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/user/home/user_property_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPropertyCard extends StatelessWidget {
  const UserPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => UserPropertyDetails());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withValues(alpha: 0.04),
            ),
          ],
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 400 / 250,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: .vertical(top: Radius.circular(24)),
                      child: Image.asset("assets/images/room.jpg", fit: .cover),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: .circle,
                      ),
                      child: Center(
                        child: CustomSvg(
                          asset: "assets/icons/heart.svg",
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 12,
                    child: Container(
                      padding: .all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(99),
                        ),
                      ),
                      child: Text(
                        "Long-term",
                        style: AppTexts.tsmm.copyWith(color: AppColors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: .symmetric(horizontal: 20, vertical: 16),
              child: Column(
                spacing: 2,
                crossAxisAlignment: .start,
                children: [
                  Text("The Aviator Suite", style: AppTexts.tlgm),
                  Row(
                    spacing: 4,
                    children: [
                      CustomSvg(
                        asset: "assets/icons/pin.svg",
                        color: AppColors.blue.shade300,
                        size: 20,
                      ),
                      Text(
                        "Los Angeles • 10 mins from LAX",
                        style: AppTexts.tmdr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: .center,
                    children: [
                      Row(
                        crossAxisAlignment: .end,
                        children: [
                          Text(
                            "\$999",
                            style: AppTexts.dsmm.copyWith(
                              color: AppColors.blue.shade400,
                            ),
                          ),
                          Text(
                            "/monthly",
                            style: AppTexts.tmdr.copyWith(
                              color: AppColors.black.shade300,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomSvg(
                        asset: "assets/icons/star.svg",
                        size: 16,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "4.5 (30)",
                        style: AppTexts.tmdm.copyWith(color: AppColors.warning),
                      ),
                    ],
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
