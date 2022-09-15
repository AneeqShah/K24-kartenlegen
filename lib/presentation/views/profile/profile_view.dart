import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';
import 'package:k24/presentation/views/profile/layout/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Profile'),
      body: const ProfileBody(),

    );
  }
}
