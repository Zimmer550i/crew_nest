import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:flutter/material.dart';

enum BookingStatus { upcoming, ongoing, completed }

class UserBookingStatus extends StatelessWidget {
  final BookingStatus status;
  const UserBookingStatus({super.key, this.status = .ongoing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: getContainerColor,
        borderRadius: .circular(16),
      ),
      child: Center(
        child: Text(
          status.name.substring(0, 1).toUpperCase() + status.name.substring(1),
          style: AppTexts.tsmm.copyWith(color: getTextColor),
        ),
      ),
    );
  }

  Color get getContainerColor {
    switch (status) {
      case .ongoing:
        return Colors.white;
      case .upcoming:
        return AppColors.blue;
      case .completed:
        return AppColors.success;
    }
  }

  Color get getTextColor {
    switch (status) {
      case .ongoing:
        return AppColors.blue;
      case .upcoming:
        return Colors.white;
      case .completed:
        return Colors.white;
    }
  }
}
