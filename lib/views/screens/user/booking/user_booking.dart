import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/views/screens/user/widgets/user_booking_card.dart';
import 'package:crew_nest/views/screens/user/widgets/user_booking_status.dart';
import 'package:flutter/material.dart';

class UserBooking extends StatefulWidget {
  const UserBooking({super.key});

  @override
  State<UserBooking> createState() => _UserBookingState();
}

class _UserBookingState extends State<UserBooking> {
  int index = 0;
  final List<String> tabs = ["All", "Ongoing", "Upcoming", "Completed"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: .symmetric(horizontal: 16, vertical: 12),
            margin: .symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: .circular(24),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                for (int i = 0; i < tabs.length; i++)
                  FittedBox(
                    fit: .scaleDown,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          index = i;
                        });
                      },
                      child: Container(
                        padding: .symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: index == i ? AppColors.blue : Colors.white,
                          borderRadius: .circular(99),
                        ),
                        child: Center(
                          child: Text(
                            tabs.elementAt(i),
                            style: index == i
                                ? AppTexts.tsmm.copyWith(color: Colors.white)
                                : AppTexts.tsmr.copyWith(
                                    color: AppColors.black.shade300,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: CustomListHandler(
              children: [
                for (int i = 0; i < 10; i++)
                  UserBookingCard(
                    status: [
                      BookingStatus.ongoing,
                      BookingStatus.ongoing,
                      BookingStatus.upcoming,
                      BookingStatus.completed,
                    ][index],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
