import 'dart:io';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_drop_down.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:crew_nest/views/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class EditPersonalInformation extends StatefulWidget {
  const EditPersonalInformation({super.key});

  @override
  State<EditPersonalInformation> createState() =>
      _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditPersonalInformation> {
  final _fullNameController = TextEditingController();
  final _languageController = TextEditingController();
  final _airlineController = TextEditingController();
  final _baseCityController = TextEditingController();

  File? _profileImage;
  // ignore: unused_field
  String? _selectedProfession;

  void onSubmit() async {}

  @override
  void dispose() {
    _fullNameController.dispose();
    _languageController.dispose();
    _airlineController.dispose();
    _baseCityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Personal Information"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 12,
            children: [
              const SizedBox(),
              ProfilePicture(
                isEditable: true,
                imageFile: _profileImage,
                imagePickerCallback: (File file) {
                  setState(() {
                    _profileImage = file;
                  });
                },
              ),
              const SizedBox(height: 20,),
              CustomTextField(
                title: "Full Name",
                leading: "assets/icons/profile.svg",
                hintText: "Enter your full name",
                controller: _fullNameController,
              ),
              CustomTextField(
                title: "Spoken Languages",
                leading: "assets/icons/globe.svg",
                hintText: "Enter your spoken languages",
                controller: _languageController,
              ),
              CustomTextField(
                title: "Airline",
                leading: "assets/icons/plane.svg",
                hintText: "Enter the Airline you work for",
                controller: _airlineController,
              ),
              CustomTextField(
                title: "Base City",
                leading: "assets/icons/pin.svg",
                hintText: "Enter your base city",
                controller: _baseCityController,
              ),
              CustomDropDown(
                title: "Profession",
                leading: "assets/icons/job.svg",
                hintText: "Enter your profession",
                options: [
                  "Ground Staff",
                  "Cabin Crew",
                  "Pilot",
                  "Other Airline Staff",
                ],
                onChanged: (index, value) {
                  setState(() {
                    _selectedProfession = value;
                  });
                },
              ),
              const SizedBox(height: 50,),
              CustomButton(text: "Save Changes")
            ],
          ),
        ),
      ),
    );
  }
}
