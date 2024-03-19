import 'package:flutter/material.dart';
import '/feature/screens/widgets/custom_app_bar.dart';

import '../../core/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          50,
        ),
        child: CustomAppBar(
          icon: Icons.person,
          mainTitle: 'Profile',
          onMenuPressed: () => print('menu'),
          onPressed: () => print('profile'),
        ),
      ),
    );
  }
}
