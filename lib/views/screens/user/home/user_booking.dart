import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/user/booking/user_booking_summery.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBooking extends StatelessWidget {
  const UserBooking({super.key});

  void onSubmit() async {
    Get.to(() => UserBookingSummery());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Booking"),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 12),
              Text("The Aviator Suite", style: AppTexts.txlm),
              const SizedBox(height: 4),
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
              Divider(thickness: 0.5, height: 50),
              CustomCalendar(),
              Spacer(),
              CustomButton(text: "1 month - \$999", isSecondary: true),
              const SizedBox(height: 12),
              CustomButton(onTap: onSubmit, text: "Book - 3 Nights"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
