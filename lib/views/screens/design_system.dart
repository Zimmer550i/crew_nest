import 'dart:io';

import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/views/widgets/custom_bottom_navbar.dart';
import 'package:crew_nest/views/widgets/custom_drop_down.dart';
import 'package:crew_nest/views/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';

class DesignSystem extends StatefulWidget {
  const DesignSystem({super.key});

  @override
  State<DesignSystem> createState() => _DesignSystemState();
}

class _DesignSystemState extends State<DesignSystem> {
  File? _image;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Design System"),
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
        onChanged: (val) {
          setState(() {
            index = val;
          });
        },
      ),
      body: CustomListHandler(
        spacing: 20,
        children: [
          const SizedBox(),
          Logo(showName: true),
          const SizedBox(),
          ProfilePicture(
            imageFile: _image,
            image: "https://picsum.photos/500/500",
            imagePickerCallback: (val) {
              setState(() {
                _image = val;
              });
            },
            isEditable: true,
          ),
          const SizedBox(),
          CustomTextField(title: "Email", hintText: "Enter your email"),
          CustomTextField(
            title: "Password",
            hintText: "Enter your password",
            isPassword: true,
          ),
          CustomDropDown(options: ["Option 1", "Option 2"], title: "Option"),
          const SizedBox(),
          CustomButton(text: "Primary Button"),
          CustomButton(text: "Secondary Button", isSecondary: true),
          CustomButton(text: "Disabled Button", isDisabled: true),
        ],
      ),
    );
  }
}
