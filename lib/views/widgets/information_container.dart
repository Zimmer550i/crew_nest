import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:flutter/material.dart';

class InformationContainer extends StatelessWidget {
  final String title;
  final String value;
  const InformationContainer({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: .all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(20),
        ),
        child: Column(
          spacing: 4,
          crossAxisAlignment: .start,
          children: [
            Text(value, style: AppTexts.dxsm),
            Text(
              title,
              style: AppTexts.tmdr.copyWith(color: AppColors.black.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
