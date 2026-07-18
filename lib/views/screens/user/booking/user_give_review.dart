import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/screens/user/widgets/user_property_card.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class UserGiveReview extends StatefulWidget {
  const UserGiveReview({super.key});

  @override
  State<UserGiveReview> createState() => _UserGiveReviewState();
}

class _UserGiveReviewState extends State<UserGiveReview> {
  double rating = 5;

  void onSubmit() async {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Give Review"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 12),
              UserPropertyCard(),
              const SizedBox(height: 16),
              _buildReviewCard(),
              const SizedBox(height: 50),
              _buildActionButtons(),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      width: double.infinity,
      padding: .all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          CustomTextField(
            title: "Your Reveiw",
            hintText: "Write here",
            radius: 12,
            lines: 3,
          ),
          const SizedBox(height: 8),
          Text("Rating", style: AppTexts.tmdr),
          const SizedBox(height: 4),
          Container(
            padding: .all(20),
            decoration: BoxDecoration(
              borderRadius: .circular(12),
              border: .all(color: AppColors.black.shade100, width: 0.5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: RatingBar(
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star, color: AppColors.warning),
                      half: Icon(Icons.star_half, color: AppColors.warning),
                      empty: Icon(
                        Icons.star_border,
                        color: AppColors.black.shade200,
                      ),
                    ),
                    wrapAlignment: .spaceBetween,
                    allowHalfRating: false,
                    glow: false,
                    initialRating: 5,
                    onRatingUpdate: (val) {
                      setState(() {
                        rating = val;
                      });
                    },
                  ),
                ),
                Text("${rating.toInt().toString()}/5", style: AppTexts.tlgm),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          flex: 2,
          child: CustomButton(
            onTap: () => Get.back(),
            text: "Cancel",
            isSecondary: true,
            padding: 0,
          ),
        ),
        Expanded(
          flex: 3,
          child: CustomButton(onTap: onSubmit, text: "Give Review", padding: 0),
        ),
      ],
    );
  }
}
