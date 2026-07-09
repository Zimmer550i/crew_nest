import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crew_nest/utils/custom_image_picker.dart';
import 'package:crew_nest/utils/custom_svg.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Colors
final _progressColor = AppColors.blue[400]!;
final _errorBackgroundColor = AppColors.blue[100]!;
const _errorIconColor = Colors.blue;
final _placeholderBorderColor = AppColors.blue[300]!;
final _placeholderIconColor = AppColors.blue[400]!;

// Sizing
const _defaultSize = 100.0;
const _avatarRadius = 100.0;
const _placeholderPaddingScale = 0.17;
const _progressStrokeWidth = 2.0;
const _editIconSize = 16.0;

// Icons
const _placeholderIcon = AppIcons.person;
const _editIcon = AppIcons.edit;

// ──────────────────────────────────────────────

class ProfilePicture extends StatelessWidget {
  final double size;
  final String? image;
  final File? imageFile;
  final bool showLoading;
  final bool isEditable;
  final Function(File)? imagePickerCallback;

  const ProfilePicture({
    super.key,
    this.image,
    this.size = _defaultSize,
    this.showLoading = true,
    this.isEditable = false,
    this.imagePickerCallback,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        if (!isEditable) {
          return;
        }

        File? image = await customImagePicker();

        if (image != null && imagePickerCallback != null) {
          imagePickerCallback!(image);
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(_avatarRadius),
            child: imageFile != null
                ? Image.file(
                    imageFile!,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  )
                : image != null
                ? CachedNetworkImage(
                    imageUrl: image!,
                    progressIndicatorBuilder: (context, url, progress) {
                      return SizedBox(
                        width: size,
                        height: size,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                            strokeWidth: _progressStrokeWidth,
                            color: _progressColor,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: size,
                        height: size,
                        color: _errorBackgroundColor,
                        child: Icon(Icons.error, color: _errorIconColor),
                      );
                    },
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: size,
                    height: size,
                    padding: EdgeInsets.all(size * _placeholderPaddingScale),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: _placeholderBorderColor),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        _placeholderIcon,
                        colorFilter: ColorFilter.mode(
                          _placeholderIconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
          ),
          if (isEditable)
            Positioned.fill(
              child: Container(
                height: _defaultSize,
                width: _defaultSize,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomSvg(asset: _editIcon, size: _editIconSize),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
