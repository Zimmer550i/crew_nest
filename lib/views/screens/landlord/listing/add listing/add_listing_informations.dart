import 'package:crew_nest/views/screens/landlord/listing/add%20listing/landlord_add_listing.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddListingInformations extends StatelessWidget {
  const AddListingInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        const SizedBox(height: 8),
        CustomTextField(
          title: "Title",
          controller: addListingKey.currentState?.titleCtrl,
          hintText: "Enter the title of your listing",
        ),
        CustomTextField(
          title: "Location",
          controller: addListingKey.currentState?.locationCtrl,
          hintText: "Enter the city or area of your listing",
        ),
        CustomTextField(
          title: "Nearest Airport",
          controller: addListingKey.currentState?.airportCtrl,
          hintText: "Enter the closest Airport name",
        ),
        CustomTextField(
          title: "House Rules",
          lines: 4,
          controller: addListingKey.currentState?.rulesCtrl,
          hintText: "Enter the rules that every renter must follow",
        ),
      ],
    );
  }
}
