import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/common/chat.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBookingSuccessful extends StatelessWidget {
  const UserBookingSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              CustomSvg(asset: "assets/icons/success.svg"),
              const SizedBox(height: 20),
              Text(
                "Payment Success!",
                style: AppTexts.dsmm,
                textAlign: .center,
              ),
              const SizedBox(height: 12),
              Text(
                "Your payment has been successful paid and the has been notified",
                textAlign: .center,
                style: AppTexts.tmdr.copyWith(color: AppColors.black.shade300),
              ),
              const SizedBox(height: 20),
              Container(
                padding: .all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(24),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          "Booking ID: #20245",
                          style: AppTexts.tlgm.copyWith(
                            color: AppColors.blue,
                            height: 1,
                          ),
                        ),
                        Text(
                          "Pending",
                          style: AppTexts.tmdm.copyWith(
                            color: AppColors.warning,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 4,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Property:",
                              style: AppTexts.tmdr.copyWith(
                                color: AppColors.black.shade300,
                              ),
                            ),
                            Text("The Aviator Suite", style: AppTexts.tmdm),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Check In:",
                              style: AppTexts.tmdr.copyWith(
                                color: AppColors.black.shade300,
                              ),
                            ),
                            Text("October 15, 2026", style: AppTexts.tmdm),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Check Out:",
                              style: AppTexts.tmdr.copyWith(
                                color: AppColors.black.shade300,
                              ),
                            ),
                            Text("October 18, 2026", style: AppTexts.tmdm),
                          ],
                        ),
                      ],
                    ),
                    Divider(height: 0),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          "Total Paid",
                          style: AppTexts.txlm.copyWith(
                            height: 1,
                            color: AppColors.blue,
                          ),
                        ),
                        Text(
                          "\$310",
                          style: AppTexts.txlm.copyWith(
                            height: 1,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Get.until((route) {
                          return route.settings.name == "/app";
                        });
                      },
                      text: "Go Back",
                      isSecondary: true,
                      padding: 0,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Get.until((route) {
                          return route.settings.name == "/app";
                        });
                        Get.to(() => Chat());
                      },
                      text: "Message Host",
                      padding: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
