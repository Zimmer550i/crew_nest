import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:flutter/material.dart';

class InformationContainer extends StatelessWidget {
  final String title;
  final String value;
  final String? highlight;
  final Color highlightColor;
  const InformationContainer({
    super.key,
    required this.title,
    required this.value,
    this.highlight,
    this.highlightColor = AppColors.blue,
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
            Row(
              crossAxisAlignment: .start,
              children: [
                Expanded(child: Text(value, style: AppTexts.dxsm)),
                if (highlight != null)
                  Text(
                    highlight!,
                    style: AppTexts.tsmm.copyWith(color: highlightColor),
                  ),
              ],
            ),
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
