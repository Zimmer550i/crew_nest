import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EditPersonalInformation extends StatelessWidget {
  const EditPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Personal Information",),
    );
  }
}