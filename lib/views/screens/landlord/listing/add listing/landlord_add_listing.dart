import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LandlordAddListing extends StatefulWidget {
  const LandlordAddListing({super.key});

  @override
  State<LandlordAddListing> createState() => _LandlordAddListingState();
}

class _LandlordAddListingState extends State<LandlordAddListing> {
  int index = 0;
  List<String> tabs = [
    "Informations",
    "Photos",
    "Details",
    "Pricing & Availability",
  ];
  List<Widget> screens = [
    FlutterLogo(size: 200),
    FlutterLogo(size: 300),
    FlutterLogo(size: 400),
    FlutterLogo(size: 500),
  ];

  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add New Listing"),
      body: Column(
        children: [
          Container(
            padding: .symmetric(vertical: 12),
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              scrollDirection: .horizontal,
              physics: ClampingScrollPhysics(),
              child: Row(
                spacing: 8,
                children: [
                  const SizedBox(width: 12),
                  for (int i = 0; i < tabs.length; i++) tab(tabs[i], i),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: .symmetric(horizontal: 20),
                  child: SafeArea(child: screens[index]),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: SafeArea(
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          if (index < tabs.length - 1) {
                            index++;
                          } else {
                            onSubmit();
                          }
                        });
                      },
                      text: index < tabs.length - 1 ? "Next" : "Submit",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tab(String name, int pos) {
    bool isSelected = pos == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          index = pos;
        });
      },
      child: Container(
        padding: .symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Colors.white,
          borderRadius: .circular(99),
        ),
        child: Center(
          child: Text(
            name,
            style: AppTexts.tsmr.copyWith(
              color: isSelected ? Colors.white : AppColors.black.shade300,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
