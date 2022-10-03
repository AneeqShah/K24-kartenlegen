import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';
import 'package:k24/presentation/views/update_profile/layout/update_body.dart';
import '../../../config/front_end_config.dart';

class UpdateProfile extends StatefulWidget {
  final String fullName;
  final String image;
  final String email;
  final String dob;
  final String zodiac;
  final bool gender;
  final String country;

  const UpdateProfile(
      {super.key,
      required this.fullName,
      required this.image,
      required this.email,
      required this.dob,
      required this.zodiac,
      required this.gender, required this.country});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Profile" ,showIcon: true),
      backgroundColor: FrontEndConfigs.bgColor,
      body: UpdateProfileBody(
          fullName: widget.fullName,
          image: widget.image,
          email: widget.email,
          dob: widget.dob,
          zodiac: widget.zodiac,
          gender: widget.gender, country: widget.country,),
    );
  }
}
