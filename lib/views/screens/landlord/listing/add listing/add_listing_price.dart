import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/screens/landlord/listing/add%20listing/landlord_add_listing.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddListingPrice extends StatefulWidget {
  const AddListingPrice({super.key});

  @override
  State<AddListingPrice> createState() => _AddListingPriceState();
}

class _AddListingPriceState extends State<AddListingPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SizedBox(height: 16),
        Container(
          padding: .all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .circular(24),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "What type of listing?",
                style: AppTexts.tmdm.copyWith(height: 1),
              ),
              const SizedBox(height: 16),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          addListingKey.currentState?.isLongTerm = false;
                        });
                      },
                      child: Container(
                        padding: .symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: addListingKey.currentState?.isLongTerm == false
                              ? AppColors.blue
                              : Colors.white,
                          borderRadius: .circular(20),
                          border: Border.all(
                            width: 0.5,
                            color: AppColors.black.shade50,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Short-terms",
                            style: AppTexts.tmdr.copyWith(
                              color:
                                  addListingKey.currentState?.isLongTerm ==
                                      false
                                  ? Colors.white
                                  : AppColors.black.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          addListingKey.currentState?.isLongTerm = true;
                        });
                      },
                      child: Container(
                        padding: .symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: addListingKey.currentState?.isLongTerm == true
                              ? AppColors.blue
                              : Colors.white,
                          borderRadius: .circular(20),
                          border: Border.all(
                            width: 0.5,
                            color: AppColors.black.shade50,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Long-terms",
                            style: AppTexts.tmdr.copyWith(
                              color:
                                  addListingKey.currentState?.isLongTerm == true
                                  ? Colors.white
                                  : AppColors.black.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        CustomTextField(
          title: "Price",
          controller: addListingKey.currentState?.priceCtrl,
          hintText:
              "Price per ${addListingKey.currentState?.isLongTerm == true ? "Month" : "Night"}",
        ),
        const SizedBox(height: 12),
        if (addListingKey.currentState?.isLongTerm == false)
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Availability", style: AppTexts.tmdm),
              const SizedBox(height: 8),
              CustomCalendar(
                markedDates: {
                  DateTime.now().add(Duration(days: 1)),
                  DateTime.now().add(Duration(days: 2)),
                  DateTime.now().add(Duration(days: 3)),
                  DateTime.now().add(Duration(days: 4)),
                  DateTime.now().add(Duration(days: 5)),
                },
              ),
            ],
          ),
        const SizedBox(height: 70),
      ],
    );
  }
}
