import 'package:crew_nest/views/screens/user/profile/user_profile.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  int index = 0;
  List<String> icons = ["home", "booking", "heart", "profile"];
  List<String> tabs = ["Home", "Booking", "Saved", "Profile"];
  List<String> titles = ["CrewNest", "My Bookings", "Saved Items", "Profile"];
  List<Widget> pages = [
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: titles[index], hasLeading: false),
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
}
