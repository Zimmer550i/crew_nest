import 'package:flutter/material.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/logo.dart';

class Info extends StatelessWidget {
  final String title;
  const Info({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(child: Logo(showName: true)),
            const SizedBox(height: 20),
            Text(
              """CrewNest is a trusted accommodation marketplace built exclusively for airline professionals. Our platform connects verified cabin crew, pilots, and airline staff with safe and reliable accommodation options around the world.

Whether you're looking for a short-term stay near your base airport, a long-term rental, or a holiday property, CrewNest helps you find accommodation within a community you can trust.

Every member is verified through their airline employment, creating a secure environment for both hosts and guests. With integrated booking, secure payments, and protected communication, CrewNest simplifies the way aviation professionals find and share accommodation.

Our mission is to create the world's most trusted housing network for the global aviation community.""",
              style: AppTexts.tmdr,
            ),
          ],
        ),
      ),
    );
  }
}
