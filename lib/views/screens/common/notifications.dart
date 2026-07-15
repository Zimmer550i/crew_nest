import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notifications"),
      body: CustomListHandler(
        children: [
          for (int i = 0; i < 10; i++)
            notificationWidget(
              "Sample Notification Title",
              "This is a sample notifcation of how it'll look when the notfication APIs will be implemented in App later in the backend phase.",
              i % 2 == 0,
            ),
        ],
      ),
    );
  }

  Widget notificationWidget(String title, String description, bool isUnseen) {
    return Container(
      padding: .symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(16),
        border: .all(width: 0.5, color: AppColors.black.shade50),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Colors.black.withValues(alpha: 0.04),
          ),
        ],
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 12,
            children: [
              if (isUnseen)
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: AppColors.error,
                  ),
                ),
              Expanded(child: Text(title, style: AppTexts.tmdm)),
              GestureDetector(
                onTap: () {},
                child: CustomSvg(asset: "assets/icons/cross.svg"),
              ),
            ],
          ),
          Text(
            description,
            textAlign: .start,
            style: AppTexts.tsmr.copyWith(color: AppColors.black.shade300),
          ),
        ],
      ),
    );
  }
}
