import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/utils/formatter.dart';
import 'package:crew_nest/views/screens/common/chat.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Messages"),
      body: CustomListHandler(
        children: [
          for (int i = 0; i < 10; i++)
            messageWidget(
              imageUrl: "https://picsum.photos/500/500",
              name: "John Doe",
              lastMessage: "Hi man, what is up with you?",
              isSeen: i % 2 == 0,
              time: DateTime.now().subtract(Duration(minutes: 1)),
            ),
        ],
      ),
    );
  }

  Widget messageWidget({
    required String imageUrl,
    required String name,
    required String lastMessage,
    bool isSeen = false,
    required DateTime time,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Chat());
      },
      child: Container(
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
        child: Row(
          spacing: 12,
          children: [
            ProfilePicture(image: imageUrl, size: 40),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    spacing: 4,
                    crossAxisAlignment: .center,
                    children: [
                      Text(name, style: AppTexts.tmdm),
                      if (!isSeen)
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: AppColors.error,
                          ),
                        ),
                      Spacer(),
                      Text(
                        Formatter.relativeDateTime(time),
                        style: AppTexts.tsmr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "data" * 50,
                    style: AppTexts.tsmr.copyWith(
                      color: AppColors.black.shade300,
                      overflow: .ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
