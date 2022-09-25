import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/elements/custom_textfield.dart';

import '../../../bottom_nav_bar/bottom_nav_bar.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Sign Up',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: 'Create account to continue',
            fontSize: 11,
            fontWeight: FontWeight.w300,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomText(text: 'Full Name'),
          AuthTextField(hint: 'John Wick', controller: emailController),
          const SizedBox(
            height: 15,
          ),
          CustomText(text: 'Country'),
          AuthTextField(hint: 'US', controller: emailController),
          const SizedBox(
            height: 15,
          ),
          CustomText(text: 'Email'),
          AuthTextField(hint: 'user@gmail.com', controller: emailController),
          const SizedBox(
            height: 15,
          ),
          CustomText(text: 'Password'),
          AuthTextField(hint: '**********', controller: pwdController),
          const SizedBox(
            height: 30,
          ),
          AppButton(
              onPressed: () {
                NavigationHelper.pushRoute(context, BottomNavBody());
              },
              text: 'Sign Up'),
        ],
      ),
    );
  }

  _signupUser() async {
    try {
      loadingTrue();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: pwdController.text)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'email': emailController.text,
          'name': fullName.text,
          'country': country.text,
          'image':"",
          'uid': FirebaseAuth.instance.currentUser!.uid,
          "joiningDate": DateTime.now().millisecondsSinceEpoch
        });
      }).then((value) async {
        NavigationHelper.pushRoute(context, BottomNavBody());
      });
    } on FirebaseException catch (e) {
      loadingFalse();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  loadingTrue() {
    isLoading = true;
    setState(() {});
  }

  loadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
