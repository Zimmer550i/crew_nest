import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LandlordWithdraw extends StatelessWidget {
  const LandlordWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Withdraw"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
                crossAxisAlignment: .start,
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
                  CustomTextField(
                    title: "Enter Amount",
                    leading: "assets/icons/dollar.svg",
                    hintText: "0.00",
                  ),
                  const SizedBox(height: 16),
                  Text("Payment method", style: AppTexts.tmdr),
                  const SizedBox(height: 4),
                  Container(
                    padding: .all(16),
                    decoration: BoxDecoration(
                      borderRadius: .circular(24),
                      border: .all(color: AppColors.black.shade100, width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: .none,
                          children: [
                            Container(
                              padding: .symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.blue.shade50,
                                borderRadius: .circular(4),
                              ),
                              child: CustomSvg(
                                asset: "assets/icons/stripe.svg",
                              ),
                            ),
                            Positioned(
                              top: -8,
                              right: -5,
                              child: CustomSvg(
                                asset: "assets/icons/selected.svg",
                                color: AppColors.blue,
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
            Spacer(),
            CustomButton(text: "Withdraw"),
            SafeArea(child: const SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
