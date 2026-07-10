import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  final bool showName;
  final bool isWhite;
  const Logo({
    super.key,
    this.size = 80,
    this.showName = false,
    this.isWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      mainAxisSize: .min,
      children: [
        Image.asset(
          "assets/images/logo${isWhite ? "_white" : ""}.png",
          height: size,
          width: size,
        ),
        if (showName)
          Text(
            "CrewNest",
            style: AppTexts.dmdm.copyWith(
              color: isWhite ? Colors.white : AppColors.blue,
              fontSize: 28,
            ),
          ),
      ],
    );
  }
}
