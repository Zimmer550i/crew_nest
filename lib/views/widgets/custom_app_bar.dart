import 'package:crew_nest/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crew_nest/utils/app_icons.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Sizing
const _appBarHeight = 44.0;
const _leadingStartPadding = 20.0;
const _leadingSize = 32.0;
const _leadingRadius = 8.0;
const _titleLeftPadding = 20.0;

// Typography
final _titleStyle = AppTexts.dssm;

// Icons
const _backIcon = AppIcons.back;

// ──────────────────────────────────────────────

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool hasLeading;
  const CustomAppBar({super.key, this.title, this.hasLeading = true});

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.bg,
      surfaceTintColor: AppColors.blue,
      titleSpacing: 0,
      title: SizedBox(
        height: _appBarHeight,
        child: Row(
          children: [
            SizedBox(width: _leadingStartPadding),
            if (hasLeading)
              InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(_leadingRadius),
                child: SizedBox(
                  height: _leadingSize,
                  width: _leadingSize,
                  child: hasLeading
                      ? Center(child: CustomSvg(asset: _backIcon))
                      : const SizedBox(),
                ),
              ),
            if (hasLeading) const SizedBox(width: _titleLeftPadding),
            Text(title ?? "", style: _titleStyle),
          ],
        ),
      ),
    );
  }
}
