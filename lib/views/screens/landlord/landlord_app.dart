import 'package:crew_nest/views/screens/landlord/profile/landlord_profile.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class LandlordApp extends StatefulWidget {
  const LandlordApp({super.key});

  @override
  State<LandlordApp> createState() => _LandlordAppState();
}

class _LandlordAppState extends State<LandlordApp> {
  int index = 0;
  List<String> icons = ["home", "booking", "listing", "earning", "profile"];
  List<String> titles = ["Home", "Booking", "Listing", "Earning", "Profile"];
  List<Widget> pages = [
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    LandlordProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hasLeading: false),
      body: pages[index],
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
        onChanged: (val) {
          setState(() {
            index = val;
          });
        },
        icons: icons,
        titles: titles,
      ),
    );
  }
}
