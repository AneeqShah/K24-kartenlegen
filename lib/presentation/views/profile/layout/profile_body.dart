import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:k24/app/Custom_image_container.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/change_password/change_password.dart';
import 'package:k24/presentation/views/payment/payment_history.dart';

import '../../auth/login/login_view.dart';
import '../../update_profile/update_profile.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String userID = FirebaseAuth.instance.currentUser!.uid;
  String userName = "";
  String userImage = "";
  String email = "";
  String dob = "";
  String zodiac = "";
  String country = "";
  bool gender = false;

  @override
  void initState() {
    _getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImageContainer(
                  height: 45, wight: 45, radius: 500, image: userImage),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () {
                        NavigationHelper.pushRoute(
                            context,
                            UpdateProfile(
                              fullName: userName,
                              image: userImage,
                              email: email,
                              dob: dob,
                              zodiac: zodiac,
                              gender: gender,
                              country: country,
                            ));
                      },
                      child: CustomText(
                        text: 'Edit Profile',
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                NavigationHelper.pushRoute(
                    context,
                    UpdateProfile(
                      fullName: userName,
                      image: userImage,
                      email: email,
                      dob: dob,
                      zodiac: zodiac,
                      gender: gender,
                      country: country,
                    ));
              },
              child: CustomText(text: 'Profile')),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Term & Conditions'),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Privacy Policy'),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                NavigationHelper.pushRoute(context, PaymentHistory());
              },
              child: CustomText(text: 'Payment History')),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                NavigationHelper.pushRoute(context, ChangePassword());
              },
              child: CustomText(text: 'Change password')),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Rate app',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'FAQ',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Delete account',
            color: Colors.red,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              _logout();
            },
            child: CustomText(
              text: 'Logout',
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }

  _logout() async {
    await FirebaseAuth.instance.signOut().then((value) {
      NavigationHelper.pushReplacement(context, LoginView());
    });
  }

  _getUserID() async {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userID)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      userName = snapshot.get("name");
      userImage = snapshot.get("image");
      email = snapshot.get("email");
      gender = snapshot.get("isMale");
      zodiac = snapshot.get("zodiac");
      country = snapshot.get("country");
      dob = snapshot.get("dob");
      setState(() {});
    });
  }
}
