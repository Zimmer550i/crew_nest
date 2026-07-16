import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/user/booking/user_booking_summary.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBooking extends StatefulWidget {
  const UserBooking({super.key});

  @override
  State<UserBooking> createState() => _UserBookingState();
}

class _UserBookingState extends State<UserBooking> {
  Set<DateTime> _selectedDates = {};

  void _onSubmit() async {
    Get.to(() => UserBookingSummary());
  }

  void _onDatesChanged(Set<DateTime> dates) {
    setState(() {
      _selectedDates = dates;
    });
  }

  int get _nightCount => _selectedDates.length;

  String get _bookButtonText {
    if (_nightCount == 0) return "Select Dates";
    return "Book - $_nightCount Night${_nightCount == 1 ? '' : 's'}";
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
              _buildPropertyHeader(),
              Divider(thickness: 0.5, height: 50),
              CustomCalendar(
                selectedDates: _selectedDates,
                onDatesChanged: _onDatesChanged,
              ),
              Spacer(),
              _buildPriceSummary(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ── Extracted builders ─────────────────────────────────────────────────

  Widget _buildPropertyHeader() {
    return Column(
      crossAxisAlignment: .start,
      children: [
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
      ],
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      children: [
        CustomButton(text: "1 month - \$999", isSecondary: true),
        const SizedBox(height: 12),
        CustomButton(
          onTap: _nightCount > 0 ? _onSubmit : null,
          text: _bookButtonText,
          isDisabled: _nightCount == 0,
        ),
      ],
    );
  }
}
