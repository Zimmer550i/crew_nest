import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/views/screens/landlord/widgets/landlord_listing_card.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LandlordListing extends StatelessWidget {
  const LandlordListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomListHandler(
              children: [for (int i = 0; i < 5; i++) LandlordListingCard(), const SizedBox(height: 20,),],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: CustomButton(onTap: () {}, text: "Add New Listing"),
          ),
          // Positioned(
          //   left: 20,
          //   right: 20,
          //   bottom: 20,
          //   child: Stack(
          //     alignment: .bottomCenter,
          //     children: [
          //       Positioned(
          //         bottom: 25,
          //         left: 0,
          //         right: 0,
          //         child: Container(
          //           width: double.infinity,
          //           height: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(
          //             gradient: LinearGradient(
          //               begin: Alignment.bottomCenter,
          //               end: Alignment.topCenter,
          //               colors: [
          //               AppColors.blue,
          //               Colors.transparent,
          //             ])
          //           ),
          //         ),
          //       ),
          //       CustomButton(onTap: () {}, text: "Add New Listing"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
