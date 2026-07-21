import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/landlord/listing/add%20listing/landlord_add_listing.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddListingDetails extends StatefulWidget {
  const AddListingDetails({super.key});

  @override
  State<AddListingDetails> createState() => _AddListingDetailsState();
}

class _AddListingDetailsState extends State<AddListingDetails> {
  List<String> amenityIcons = ["wifi", "gym", "coffee", "blackout", "shuttle"];
  List<String> amenityTitles = [
    "Giga-WiFi",
    "24/7 Gym",
    "Nespresso",
    "Blackout",
    "Shuttle",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const SizedBox(height: 0),
        CustomTextField(
          title: "Description",
          lines: 5,
          controller: addListingKey.currentState?.descriptionCtrl,
          hintText: "Write something about your property",
        ),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: CustomTextField(
                title: "Bedrooms",
                controller: addListingKey.currentState?.bedsCtrl,
                hintText: "No. of Bedrooms",
              ),
            ),
            Expanded(
              child: CustomTextField(
                title: "Guests",
                controller: addListingKey.currentState?.guestsCtrl,
                hintText: "Maximum",
              ),
            ),
          ],
        ),
        Container(
          padding: .all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .circular(20),
          ),
          child: Column(
            spacing: 12,
            crossAxisAlignment: .stretch,
            children: [
              Text("Premium Amenities", style: AppTexts.tmdm),
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: .zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                children: [
                  for (int i = 0; i < 5; i++)
                    if (addListingKey.currentState != null) amenity(i),
                  for (int i = 0; i < 30 % 5; i++) Container(),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 70),
      ],
    );
  }

  GestureDetector amenity(int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (addListingKey.currentState!.amenities.contains(pos)) {
            addListingKey.currentState!.amenities.remove(pos);
          } else {
            addListingKey.currentState!.amenities.add(pos);
          }
        });
      },
      child: Container(
        padding: .symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: addListingKey.currentState!.amenities.contains(pos)
              ? AppColors.blue.shade50
              : Colors.white,
          borderRadius: .circular(16),
          border: Border.all(width: 0.5, color: AppColors.black.shade50),
        ),
        child: Column(
          // spacing: 4,
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          children: [
            CustomSvg(
              asset: "assets/icons/${amenityIcons.elementAt(pos)}.svg",
              size: 32,
            ),
            FittedBox(
              child: Text(amenityTitles.elementAt(pos), style: AppTexts.tsmr),
            ),
          ],
        ),
      ),
    );
  }
}
