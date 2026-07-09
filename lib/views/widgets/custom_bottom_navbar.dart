import 'package:flutter/material.dart';
import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Colors
const _selectedColor = AppColors.blue;
final _unselectedColor = AppColors.black.shade300;

// Sizing
const _borderRadius = 16.0;
const _verticalPadding = 12.0;
const _iconSize = 24.0;
const _labelSpacing = 4.0;

// Typography
final _labelStyle = AppTexts.tsmm;

// ──────────────────────────────────────────────

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int)? onChanged;
  const CustomBottomNavbar({super.key, required this.index, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(_borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: _verticalPadding),
        child: SafeArea(
          child: Row(
            children: [
              item("Home", "home", 0),
              item("Bookings", "booking", 1),
              item("Saved", "heart", 2),
              item("Profile", "profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(String name, String icon, int pos) {
    bool isSelected = pos == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) onChanged!(pos);
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisSize: .min,
          children: [
            CustomSvg(
              asset: "assets/icons/$icon${isSelected ? "_selected" : ""}.svg",
              size: _iconSize,
            ),
            const SizedBox(height: _labelSpacing),
            Text(
              name,
              style: _labelStyle.copyWith(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? _selectedColor : _unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
