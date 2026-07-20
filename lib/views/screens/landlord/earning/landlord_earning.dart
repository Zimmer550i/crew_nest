import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/utils/formatter.dart';
import 'package:crew_nest/views/screens/landlord/earning/landlord_withdraw.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/information_container.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandlordEarning extends StatelessWidget {
  const LandlordEarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              spacing: 12,
              children: [
                InformationContainer(
                  title: "Earning",
                  value: "\$${Formatter.compactNumber(93002)}",
                ),
                InformationContainer(
                  title: "Average",
                  value: "\$${Formatter.compactNumber(112)}",
                ),
                InformationContainer(title: "Occupancy", value: "72%"),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: .symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(24),
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
                  Row(
                    children: [
                      CustomSvg(asset: "assets/icons/withdraw.svg"),
                      Expanded(
                        child: Text(
                          "Withdrawable Amount",
                          style: AppTexts.tlgm,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: .all(20),
                    decoration: BoxDecoration(
                      color: AppColors.blue.shade50,
                      borderRadius: .circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Total",
                          style: AppTexts.tmdm.copyWith(color: AppColors.blue),
                        ),
                        Text(
                          "\$1,250",
                          style: AppTexts.dsms.copyWith(color: AppColors.blue),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    onTap: () {
                      Get.to(() => LandlordWithdraw());
                    },
                    text: "Withdraw Now",
                    height: 44,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Earning History", style: AppTexts.txlm),
            ),
            Expanded(
              child: CustomListHandler(
                horizontalPadding: 0,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      padding: .all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(24),
                      ),
                      child: Row(
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
                                        style: AppTexts.tlgm.copyWith(
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "\$120",
                                      style: AppTexts.tmdr.copyWith(
                                        color: AppColors.blue,
                                        height: 1,
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
                                    Text(
                                      "Processing",
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
