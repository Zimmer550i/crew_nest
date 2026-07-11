import 'dart:io';

import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  List<File> files = [];

  void onSubmit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Contact Support"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                title: "Problem",
                lines: 5,
                hintText: "Describe your problem here",
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Attach File", style: AppTexts.tmdr),
              ),
              const SizedBox(height: 8),
              for (var i in files)
                Row(
                  children: [
                    Expanded(child: Text(i.path.split("/").last)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          files.remove(i);
                        });
                      },
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: Icon(
                          Icons.close_rounded,
                          size: 24,
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
              GestureDetector(
                onTap: () async {
                  final pickerResult = await FilePicker.pickFiles(
                    compressionQuality: 70,
                  );
                  if (pickerResult != null) {
                    for (var i in pickerResult.files) {
                      if (i.path != null) {
                        setState(() {
                          files.add(File(i.path!));
                        });
                      }
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.black.shade200,
                      width: 0.5,
                    ),
                    borderRadius: .circular(20),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16, width: double.infinity),
                      CustomSvg(asset: "assets/icons/upload.svg"),
                      const SizedBox(height: 10),
                      Text(
                        "Click here to upload",
                        style: AppTexts.tsmr.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomButton(onTap: onSubmit, text: "Submit"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
