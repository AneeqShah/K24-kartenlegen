import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k24/app/Custom_image_container.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/change_password/change_password.dart';
import 'package:k24/presentation/views/emergency/Emergency_contact.dart';
import 'package:k24/presentation/views/faq/FAQScreen.dart';
import 'package:k24/presentation/views/payment/payment_history.dart';
import 'package:k24/presentation/views/splash/splash_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  height: 50 , wight: 50, radius: 500, image: userImage),
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
          InkWell(
            onTap: () {
              NavigationHelper.pushRoute(context, FaqScreen());
            },
            child: CustomText(
              text: 'FAQ',
            ),
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
              NavigationHelper.pushRoute(context, EmergencyContact());
            },
            child: CustomText(
              text: 'Emergency Contact\'s',
            ),
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
                _launchUrl(
                    "https://docs.google.com/document/d/1D5csZ9p6k6cMMRjTtnT2uEqFf9Wxxvegx9POBLuxAwY/edit?usp=sharing");
              },
              child: CustomText(text: 'Term & Conditions')),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                _launchUrl(
                    "https://docs.google.com/document/d/19FmL1Tj4UAa3bLwi9Woq-azlg0Pa48PkfpbrG4HLNVc/edit?usp=sharing");
              },
              child: CustomText(text: 'Privacy Policy')),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text("Delete Account"),
                        content: CustomText(
                          text:
                              "Are you sure you want to delete your account? You will lose all your data permanently.",
                          // color: Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: CustomText(
                              text: "Delete",
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            onPressed: () {
                              _deleteAccount();
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text("No"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ));
            },
            child: CustomText(
              text: 'Delete account',
              color: Colors.red,
            ),
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

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  _deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .delete()
          .then((value) async {
        await user.delete().then((value) {
          NavigationHelper.pushReplacement(context, SplashView());
        });
      });
    }
  }
}
