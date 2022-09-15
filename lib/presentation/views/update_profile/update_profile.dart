import 'package:flutter/material.dart';
import 'package:k24/presentation/views/update_profile/layout/update_body.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: UpdateProfileBody(),
    );
  }
}
