import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFilter extends StatefulWidget {
  const UserFilter({super.key});

  @override
  State<UserFilter> createState() => _UserFilterState();
}

class _UserFilterState extends State<UserFilter> {
  double distance = 0.60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Filter"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 8,
            crossAxisAlignment: .start,
            children: [
              Text("Property Type", style: AppTexts.tmdr),
              Container(
                padding: .all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(99),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: .symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: .circular(99),
                        ),
                        child: Center(
                          child: Text(
                            "Short Term",
                            style: AppTexts.tsmr.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: .symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: .circular(99),
                        ),
                        child: Center(
                          child: Text(
                            "Apartment",
                            style: AppTexts.tsmr.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              Row(
                crossAxisAlignment: .end,
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: "Price Range",
                      hintText: "Minimum",
                    ),
                  ),
                  Expanded(child: CustomTextField(hintText: "Maximum")),
                ],
              ),
              const SizedBox(),
              Row(
                crossAxisAlignment: .end,
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomTextField(title: "Bed", hintText: "Minimum"),
                  ),
                  Expanded(
                    child: CustomTextField(title: "Guest", hintText: "Maximum"),
                  ),
                ],
              ),
              const SizedBox(),
              Container(
                padding: .all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Distance From Airport", style: AppTexts.tmdm),
                    const SizedBox(height: 12),
                    Row(
                      spacing: 12,
                      // crossAxisAlignment: .end,
                      children: [
                        Expanded(
                          child: Slider(
                            value: distance,
                            activeColor: AppColors.blue,
                            padding: .zero,
                            onChanged: (val) {
                              setState(() {
                                distance = val;
                              });
                            },
                          ),
                        ),
                        Text(
                          "${(distance * 100).toInt()}m",
                          style: AppTexts.txsm.copyWith(height: 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              Text("Availability", style: AppTexts.tmdr),
              CustomCalendar(),
              const SizedBox(height: 50),
              CustomButton(onTap: () => Get.back(), text: "Apply Filter"),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
