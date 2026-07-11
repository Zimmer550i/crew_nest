import 'package:crew_nest/models/clickable_options.dart';
import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/formatter.dart';
import 'package:crew_nest/views/screens/auth/login.dart';
import 'package:crew_nest/views/screens/common/contact_support.dart';
import 'package:crew_nest/views/screens/common/edit_personal_information.dart';
import 'package:crew_nest/views/screens/common/faq.dart';
import 'package:crew_nest/views/screens/common/info.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/information_container.dart';
import 'package:crew_nest/views/widgets/menu_options.dart';
import 'package:crew_nest/views/widgets/overlay_confirmation.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandlordProfile extends StatefulWidget {
  const LandlordProfile({super.key});

  @override
  State<LandlordProfile> createState() => _LandlordProfileState();
}

class _LandlordProfileState extends State<LandlordProfile> {
  bool recieveNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              ProfilePicture(image: "https://picsum.photos/500/500"),
              const SizedBox(height: 8),
              Text("User Name Here", style: AppTexts.dxsm),
              const SizedBox(height: 6),
              Text(
                "Work Email: xyz@gmail.com",
                style: AppTexts.tmdr.copyWith(color: AppColors.black.shade300),
              ),
              const SizedBox(height: 6),
              Text(
                "Personal Email: xyz@gmail.com",
                style: AppTexts.tmdr.copyWith(color: AppColors.black.shade300),
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 12,
                children: [
                  InformationContainer(title: "Bookings", value: "12"),
                  InformationContainer(title: "Earning", value: "\$${Formatter.compactNumber(93002)}"),
                  InformationContainer(title: "Ratings", value: "4.5"),
                ],
              ),
              sectionTitle("Account"),
              MenuOptions(
                options: [
                  ClickableOptions(
                    iconName: "profile",
                    title: "Edit Personal Information",
                    onClick: () {
                      Get.to(() => EditPersonalInformation());
                    },
                  ),
                  // ClickableOptions(
                  //   iconName: "globe",
                  //   title: "Change Language",
                  //   onClick: () {
                  //     // Get.to(()=> )
                  //   },
                  // ),
                  ClickableOptions(
                    iconName: "bell",
                    title: "Received Notification Via Email",
                    isEnabled: recieveNotifications,
                    onChange: (val) {
                      setState(() {
                        recieveNotifications = val;
                      });
                    },
                  ),
                ],
              ),
              sectionTitle("Support"),
              MenuOptions(
                options: [
                  ClickableOptions(
                    iconName: "faq",
                    title: "FAQ",
                    onClick: () {
                      Get.to(() => Faq());
                    },
                  ),
                  ClickableOptions(
                    iconName: "support",
                    title: "Contact Support",
                    onClick: () {
                      Get.to(() => ContactSupport());
                    },
                  ),
                ],
              ),
              sectionTitle("Legal"),
              MenuOptions(
                options: [
                  ClickableOptions(
                    iconName: "logo",
                    title: "About Us",
                    onClick: () {
                      Get.to(() => Info(title: "About Us"));
                    },
                  ),
                  ClickableOptions(
                    iconName: "privacy",
                    title: "Privacy Policy",
                    onClick: () {
                      Get.to(() => Info(title: "Privacy Policy"));
                    },
                  ),
                  ClickableOptions(
                    iconName: "terms",
                    title: "Terms & Service",
                    onClick: () {
                      Get.to(() => Info(title: "Terms & Service"));
                    },
                  ),
                ],
              ),
              sectionTitle("App"),
              MenuOptions(
                options: [
                  ClickableOptions(
                    iconName: "star",
                    title: "Rate CrewNest",
                    onClick: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: CustomButton(
                      padding: 0,
                      text: "Delete Account",
                      isSecondary: true,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => OverlayConfirmation(
                            title: "Are you sure you want to",
                            highlight: "Logout",
                            buttonTextLeft: "Cancel",
                            buttonCallBackLeft: () {
                              Get.back();
                            },
                            buttonTextRight: "Logout",
                            buttonCallBackRight: () {
                              Get.offAll(() => Login());
                            },
                          ),
                        );
                      },
                      padding: 0,
                      text: "Log Out",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Column sectionTitle(String title) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: .centerLeft,
          child: Text(title, style: AppTexts.tlgm),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
