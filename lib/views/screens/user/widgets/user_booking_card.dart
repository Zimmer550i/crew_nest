import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/screens/user/booking/user_booking_summary.dart';
import 'package:crew_nest/views/screens/user/widgets/user_booking_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBookingCard extends StatelessWidget {
  final BookingStatus status;
  const UserBookingCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => UserBookingSummary());
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
          crossAxisAlignment: .start,
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
                    child: UserBookingStatus(status: status),
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
                  Text(
                    "15 Oct - 18 Oct (3 Nights)",
                    style: AppTexts.tmdr.copyWith(
                      color: AppColors.black.shade300,
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
