import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_image_picker.dart';
import 'package:crew_nest/views/screens/landlord/listing/add%20listing/landlord_add_listing.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddListingPhotos extends StatefulWidget {
  const AddListingPhotos({super.key});

  @override
  State<AddListingPhotos> createState() => _AddListingPhotosState();
}

class _AddListingPhotosState extends State<AddListingPhotos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SizedBox(height: 16),
        Text("Add Photos", style: AppTexts.tlgm),
        const SizedBox(height: 12),
        Text(
          "Add at least 3 photos. First photo will be the cover.",
          style: AppTexts.tsmr.copyWith(color: AppColors.black.shade300),
        ),
        const SizedBox(height: 32),
        if (addListingKey.currentState != null)
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            children: [
              for (var i in addListingKey.currentState!.photos)
                Stack(
                  fit: .expand,
                  clipBehavior: .none,
                  children: [
                    ClipRRect(
                      borderRadius: .circular(16),
                      child: Image.file(i, fit: .cover),
                    ),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            addListingKey.currentState!.photos.remove(i);
                          });
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            shape: .circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              if (addListingKey.currentState!.photos.length !=
                  addListingKey.currentState!.maxPhotoCount)
                GestureDetector(
                  onTap: () async {
                    final temp = await customImagePicker(
                      isCircular: false,
                      isSquared: false,
                    );

                    if (temp != null) {
                      setState(() {
                        addListingKey.currentState!.photos.add(temp);
                      });
                    }
                  },
                  behavior: .translucent,
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(16),
                      dashPattern: [2, 2],
                      color: AppColors.black.shade300,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_rounded,
                        size: 32,
                        color: AppColors.black.shade400,
                      ),
                    ),
                  ),
                ),

              for (
                int i = 1;
                i <
                    (addListingKey.currentState!.maxPhotoCount -
                        addListingKey.currentState!.photos.length);
                i++
              )
                Container(),
            ],
          ),
        const SizedBox(height: 70),
      ],
    );
  }
}
