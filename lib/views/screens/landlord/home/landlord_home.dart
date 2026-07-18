import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/utils/formatter.dart';
import 'package:crew_nest/views/screens/landlord/widgets/landlord_booking_card.dart';
import 'package:crew_nest/views/widgets/information_container.dart';
import 'package:flutter/material.dart';

class LandlordHome extends StatelessWidget {
  const LandlordHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              spacing: 12,
              children: [
                InformationContainer(
                  title: "Total Earning",
                  value: "\$${Formatter.compactNumber(9234)}",
                  highlight: "+12%",
                  highlightColor: AppColors.success,
                ),
                InformationContainer(
                  title: "Listing",
                  value: "19",
                  highlight: "Active",
                  highlightColor: AppColors.warning,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              spacing: 12,
              children: [
                InformationContainer(
                  title: "Booking",
                  value: "13",
                  highlight: "Ongoing",
                ),
                InformationContainer(
                  title: "Booking",
                  value: "11",
                  highlight: "Pending",
                  highlightColor: AppColors.error,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("New Booking Request", style: AppTexts.txlm),
            Expanded(
              child: CustomListHandler(
                horizontalPadding: 0,
                children: [for (int i = 0; i < 5; i++) LandlordBookingCard()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
