import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/screens/user/home/user_filter.dart';
import 'package:crew_nest/views/screens/user/widgets/user_property_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              padding: .all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(24),
                border: Border.all(width: 0.5, color: AppColors.black.shade100),
              ),
              child: Row(
                spacing: 16,
                children: [
                  CustomSvg(asset: "assets/icons/search.svg"),
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      onTapOutside: (event) {
                        _focusNode.unfocus();
                      },
                      decoration: InputDecoration(
                        border: .none,
                        isCollapsed: true,
                        isDense: true,
                        hintText: "Search here",
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => UserFilter()),
                    child: CustomSvg(asset: "assets/icons/filter.svg"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text("Top Crew Picks", style: AppTexts.tlgm),
            Expanded(
              child: CustomListHandler(
                horizontalPadding: 0,
                children: [for (int i = 0; i < 5; i++) UserPropertyCard()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
