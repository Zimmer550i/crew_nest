import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/views/screens/user/widgets/user_property_card.dart';
import 'package:flutter/material.dart';

class UserSaved extends StatelessWidget {
  const UserSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomListHandler(
        children: [for (int i = 0; i < 5; i++) UserPropertyCard()],
      ),
    );
  }
}
