import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_icons.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/landlord/widgets/landlord_booking_card.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandlordListingDetails extends StatefulWidget {
  const LandlordListingDetails({super.key});

  @override
  State<LandlordListingDetails> createState() => _LandlordListingDetailsState();
}

class _LandlordListingDetailsState extends State<LandlordListingDetails> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(isTransparent: true, showScrollTint: false),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    PageView(
                      onPageChanged: (value) {
                        setState(() {
                          imageIndex = value;
                          if (imageIndex >= 5) {
                            imageIndex = 0;
                          } else if (imageIndex < 0) {
                            imageIndex = 4;
                          }
                        });
                      },
                      children: [
                        for (int i = 0; i < 5; i++)
                          Image.asset("assets/images/room.jpg", fit: .cover),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothIndicator(
                          offset: imageIndex.toDouble(),
                          count: 5,
                          size: Size(72, 20),
                          effect: WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 8,
                            activeDotColor: Colors.white,
                            dotColor: Color(0xff8390A2),
                            type: .underground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: .all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "The Aviator Suite",
                            style: AppTexts.tlgm,
                          ),
                        ),
                        CustomSvg(
                          asset: "assets/icons/star.svg",
                          size: 16,
                          color: AppColors.warning,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "4.5 (30)",
                          style: AppTexts.tmdm.copyWith(
                            color: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
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
                    const SizedBox(height: 4),
                    Row(
                      spacing: 4,
                      children: [
                        Text(
                          "\$99/per day",
                          style: AppTexts.tmdm.copyWith(color: AppColors.blue),
                        ),
                        Spacer(),
                        CustomSvg(asset: "assets/icons/booking.svg", size: 16),
                        Text(
                          "7 Booking",
                          style: AppTexts.tmdr.copyWith(
                            color: AppColors.black.shade300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    expansibleInfo(
                      "Availability",
                      ExpansibleController(),
                      CustomCalendar(
                        markedDates: {
                          DateTime.now().add(Duration(days: 1)),
                          DateTime.now().add(Duration(days: 2)),
                          DateTime.now().add(Duration(days: 3)),
                          DateTime.now().add(Duration(days: 4)),
                          DateTime.now().add(Duration(days: 5)),
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: LandlordBookingCard(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget expansibleInfo(
    String title,
    ExpansibleController controller,
    Widget child,
  ) {
    return Expansible(
      animationStyle: AnimationStyle(duration: Duration(milliseconds: 100)),
      headerBuilder: (context, animation) {
        return GestureDetector(
          onTap: () {
            controller.toggle();
          },
          child: Container(
            padding: .symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: controller.isExpanded
                    ? BorderSide.none
                    : BorderSide(width: 0.5, color: AppColors.black.shade300),
              ),
            ),
            child: Row(
              spacing: 12,
              children: [
                Expanded(child: Text(title, style: AppTexts.tlgm)),
                AnimatedBuilder(
                  animation: animation,
                  builder: (ctx, val) {
                    return AnimatedRotation(
                      duration: Duration(milliseconds: 100),
                      turns: 1 - (animation.value * 0.5),
                      child: CustomSvg(
                        asset: AppIcons.arrowDown,
                        size: 24,
                        color: AppColors.black.shade400,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      bodyBuilder: (context, animation) {
        return child;
      },
      controller: controller,
    );
  }
}
