import 'package:crew_nest/models/clickable_options.dart';
import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {
  final List<ClickableOptions> options;
  const MenuOptions({super.key, this.options = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
      ),
      child: Column(
        spacing: 8,
        children: [
          for (var i in options)
            GestureDetector(
              onTap: () {
                i.onClick?.call();
              },
              child: SizedBox(
                height: 32,
                child: Row(
                  spacing: 12,
                  children: [
                    CustomSvg(
                      asset: "assets/icons/${i.iconName}.svg",
                      size: 24,
                    ),
                    Expanded(
                      child: Text(
                        i.title,
                        style: AppTexts.tmdr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                    ),
                    if (i.onChange == null && i.onClick != null)
                      CustomSvg(
                        asset: "assets/icons/arrow_forward.svg",
                        size: 24,
                      ),
                    if (i.onChange != null && i.onClick == null)
                      Switch(
                        value: i.isEnabled,
                        padding: .all(0),
                        activeTrackColor: AppColors.blue,
                        inactiveTrackColor: AppColors.black.shade50,
                        onChanged: i.onChange,
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
