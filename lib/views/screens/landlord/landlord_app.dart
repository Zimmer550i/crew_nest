import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/common/inbox.dart';
import 'package:crew_nest/views/screens/common/notifications.dart';
import 'package:crew_nest/views/screens/landlord/booking/landlord_booking.dart';
import 'package:crew_nest/views/screens/landlord/home/landlord_home.dart';
import 'package:crew_nest/views/screens/landlord/listing/landlord_listing.dart';
import 'package:crew_nest/views/screens/landlord/profile/landlord_profile.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandlordApp extends StatefulWidget {
  const LandlordApp({super.key});

  @override
  State<LandlordApp> createState() => _LandlordAppState();
}

class _LandlordAppState extends State<LandlordApp> {
  int index = 0;
  List<String> icons = ["home", "booking", "listing", "earning", "profile"];
  List<String> tabs = ["Home", "Booking", "Listing", "Earning", "Profile"];
  List<String> titles = [
    "CrewNest",
    "Booking",
    "Listing",
    "Earning",
    "Profile",
  ];
  List<Widget> pages = [
    LandlordHome(),
    LandlordBooking(),
    LandlordListing(),
    FlutterLogo(),
    LandlordProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: false,
        title: titles[index],
        showScrollTint: ![0, 1].contains(index),
        actions: [
          actionButton("bell", () {
            Get.to(() => Notifications());
          }),
          actionButton("message", () {
            Get.to(() => Inbox());
          }),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
        onChanged: (val) {
          setState(() {
            index = val;
          });
        },
        icons: icons,
        titles: tabs,
      ),
    );
  }

  Widget actionButton(String iconName, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(shape: .circle, color: Colors.white),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomSvg(asset: "assets/icons/$iconName.svg"),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
