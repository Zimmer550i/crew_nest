import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_icons.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/user/home/user_booking.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserPropertyDetails extends StatefulWidget {
  const UserPropertyDetails({super.key});

  @override
  State<UserPropertyDetails> createState() => _UserPropertyDetailsState();
}

class _UserPropertyDetailsState extends State<UserPropertyDetails> {
  int imageIndex = 0;
  final _aboutPropertyController = ExpansibleController();
  final _reviewController = ExpansibleController();
  final _houseRulesController = ExpansibleController();
  final _availabilityController = ExpansibleController();

  void onSubmit() async {
    Get.to(() => UserBooking());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        isTransparent: true,
        showScrollTint: false,
        actions: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(color: Colors.white, shape: .circle),
            child: Center(
              child: CustomSvg(asset: "assets/icons/heart.svg", size: 20),
            ),
          ),
        ],
      ),
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
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("The Aviator Suite", style: AppTexts.tlgm),
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
                            height: 1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Container(
                      padding: .all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(24),
                      ),
                      child: Row(
                        spacing: 16,
                        crossAxisAlignment: .start,
                        children: [
                          ProfilePicture(size: 46),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  "Hosted By",
                                  style: AppTexts.tmdr.copyWith(
                                    color: AppColors.black.shade300,
                                    height: 1,
                                  ),
                                ),
                                Text("Capt. Marcus", style: AppTexts.txlm),
                                Text(
                                  "Host for 2 years",
                                  style: AppTexts.tmdr.copyWith(
                                    color: AppColors.black.shade300,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: .symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              borderRadius: .circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Verified",
                                style: AppTexts.txss.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    expansibleInfo(
                      "About Property",
                      _aboutPropertyController,
                      Container(
                        width: double.infinity,
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: .circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "Description" * 30,
                              style: AppTexts.tmdr.copyWith(
                                color: AppColors.black.shade300,
                                height: 1.2,
                              ),
                            ),
                            Divider(),
                            Row(
                              spacing: 16,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: .all(16),
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xfff0f1f3,
                                      ).withValues(alpha: 0.5),
                                      borderRadius: .circular(20),
                                    ),
                                    child: Column(
                                      spacing: 12,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text("Bed", style: AppTexts.tmdm),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: .circular(16),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: AppTexts.tmdr,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: .all(16),
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xfff0f1f3,
                                      ).withValues(alpha: 0.5),
                                      borderRadius: .circular(20),
                                    ),
                                    child: Column(
                                      spacing: 12,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text("Guest", style: AppTexts.tmdm),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: .circular(16),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: AppTexts.tmdr,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: .all(16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xfff0f1f3).withValues(alpha: 0.5),
                                borderRadius: .circular(20),
                              ),
                              child: Column(
                                spacing: 12,
                                crossAxisAlignment: .stretch,
                                children: [
                                  Text(
                                    "Premium Amenities",
                                    style: AppTexts.tmdm,
                                  ),
                                  Wrap(
                                    alignment: .spaceBetween,
                                    crossAxisAlignment: .start,
                                    spacing: 4,
                                    runSpacing: 12,
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Container(
                                          padding: .symmetric(
                                            horizontal: 20,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: .circular(16),
                                          ),
                                          child: Column(
                                            spacing: 4,
                                            mainAxisSize: .min,
                                            children: [
                                              CustomSvg(
                                                asset: "assets/icons/wifi.svg",
                                                size: 32,
                                              ),
                                              Text(
                                                "Giga-Wifi",
                                                style: AppTexts.tsmr,
                                              ),
                                            ],
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
                    ),
                    const SizedBox(height: 8),
                    expansibleInfo(
                      "Review",
                      _reviewController,
                      Container(
                        width: double.infinity,
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: .circular(24),
                        ),
                        child: Column(
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                ProfilePicture(size: 28),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "First Officer Sarah",
                                        style: AppTexts.tmdm,
                                      ),
                                      RatingBar(
                                        glow: false,
                                        itemSize: 16,
                                        ratingWidget: RatingWidget(
                                          full: CustomSvg(
                                            asset: "assets/icons/star.svg",
                                            color: AppColors.warning,
                                          ),
                                          half: CustomSvg(
                                            asset: "assets/icons/star.svg",
                                          ),
                                          empty: CustomSvg(
                                            asset: "assets/icons/star.svg",
                                            color: AppColors.black.shade200,
                                          ),
                                        ),
                                        onRatingUpdate: (val) {},
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: CustomSvg(
                                    asset: "assets/icons/arrow_left.svg",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: CustomSvg(
                                    asset: "assets/icons/arrow_right.svg",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Perfect for recovery. The blackout blinds are truly 100% effective. Best rest between LHR",
                              textAlign: .start,
                              style: AppTexts.tsmr,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    expansibleInfo(
                      "House Rules",
                      _houseRulesController,
                      Container(
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
                            for (int i = 1; i < 5; i++)
                              Text(
                                "House rule no. $i",
                                style: AppTexts.tmdr.copyWith(height: 1),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    expansibleInfo(
                      "Availability",
                      _availabilityController,
                      CustomCalendar(
                        markedDates: {
                          DateTime.now(),
                          DateTime.now().add(Duration(days: 1)),
                          DateTime.now().add(Duration(days: 2)),
                          DateTime.now().add(Duration(days: 3)),
                          DateTime.now().add(Duration(days: 5)),
                          DateTime.now().add(Duration(days: 6)),
                          DateTime.now().add(Duration(days: 9)),
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButton(onTap: onSubmit, text: "Book Now"),
                    const SizedBox(height: 20),
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
