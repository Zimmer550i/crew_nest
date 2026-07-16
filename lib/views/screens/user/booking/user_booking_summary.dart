import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/screens/user/home/user_booking_successful.dart';
import 'package:crew_nest/views/screens/user/widgets/user_property_card.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBookingSummary extends StatelessWidget {
  const UserBookingSummary({super.key});

  void onSubmit() async {
    Get.to(() => UserBookingSuccessful());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Booking Summary"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 12),
              UserPropertyCard(),
              const SizedBox(height: 16),
              _buildBookedDaysCard(),
              const SizedBox(height: 16),
              _buildPricingBreakdown(),
              const SizedBox(height: 50),
              _buildActionButtons(),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }

  // ── Extracted builders ─────────────────────────────────────────────────

  Widget _buildBookedDaysCard() {
    return Container(
      width: double.infinity,
      padding: .all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          Text("Booked Days", style: AppTexts.tlgm),
          Divider(height: 0, thickness: 0.5),
          for (int i = 1; i < 4; i++)
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "October ${18 + i}",
                  style: AppTexts.tmdr.copyWith(height: 1),
                ),
                Text(
                  "\$100",
                  style: AppTexts.tmdm.copyWith(height: 1),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPricingBreakdown() {
    return Column(
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              "\$100 X 3 nights",
              style: AppTexts.tmdr.copyWith(
                color: AppColors.black.shade300,
              ),
            ),
            Text("\$300", style: AppTexts.txlm),
          ],
        ),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              "Platform fee",
              style: AppTexts.tmdr.copyWith(
                color: AppColors.black.shade300,
              ),
            ),
            Text("\$10", style: AppTexts.txlm),
          ],
        ),
        Divider(height: 0),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Total", style: AppTexts.txlm.copyWith(height: 1)),
            Text("\$310", style: AppTexts.txlm.copyWith(height: 1)),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: CustomButton(
            text: "Cancel",
            isSecondary: true,
            padding: 0,
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: onSubmit,
            text: "Confirm & Pay",
            padding: 0,
          ),
        ),
      ],
    );
  }
}
