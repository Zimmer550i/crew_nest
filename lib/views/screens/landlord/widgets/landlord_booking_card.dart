import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class LandlordBookingCard extends StatelessWidget {
  const LandlordBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
      ),
      child: Column(
        children: [
          Row(
            spacing: 12,
            children: [
              ProfilePicture(size: 52),
              Expanded(
                child: Column(
                  mainAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "First Officer Alex",
                            style: AppTexts.tlgm.copyWith(height: 1),
                          ),
                        ),
                        Text(
                          "1 day ago",
                          style: AppTexts.tsmr.copyWith(
                            color: AppColors.black.shade300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "British Airways",
                            style: AppTexts.tmdr.copyWith(
                              color: AppColors.black.shade300,
                              height: 1,
                            ),
                          ),
                        ),
                        CustomSvg(
                          asset: "assets/icons/star.svg",
                          size: 16,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "4.5 (30)",
                          style: AppTexts.tmdm.copyWith(
                            color: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: .all(16),
            decoration: BoxDecoration(
              color: Color(0xfff0f1f3).withValues(alpha: 0.5),
              borderRadius: .circular(24),
            ),
            child: Column(
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Property",
                      style: AppTexts.tmdr.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),
                    Text("The Captain's Quarters", style: AppTexts.tmdm),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Dates",
                      style: AppTexts.tmdr.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),
                    Text("15 Oct - 18 Oct", style: AppTexts.tmdm),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Cost",
                      style: AppTexts.tmdr.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),
                    Text("\$300", style: AppTexts.tmdm),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Payment Status",
                      style: AppTexts.tmdr.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),
                    Text(
                      "Done",
                      style: AppTexts.tmdm.copyWith(color: AppColors.success),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  text: "Decline",
                  isSecondary: true,
                ),
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  text: "Accept",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
