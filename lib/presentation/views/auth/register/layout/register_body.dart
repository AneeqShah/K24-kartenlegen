import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:k24/app/custom_loader.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/elements/custom_textfield.dart';
import 'package:k24/presentation/views/auth/login/login_view.dart';

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
    return CustomLoader(
      isLoading: isLoading,
      child: Padding(
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
            AuthTextField(hint: 'John Wick', controller: fullName),
            const SizedBox(
              height: 15,
            ),
            CustomText(text: 'Country'),
            AuthTextField(hint: 'US', controller: country),
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
                  if (fullName.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Fullname can't be empty");
                  } else if (country.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Country can't be empty");
                  } else if (emailController.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Email can't be empty");
                  } else if (pwdController.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Password can't be empty");
                  } else {
                    _signupUser();
                  }
                },
                text: 'Sign Up'),
          ],
        ),
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
          'firstQuestion': true,
          'email': emailController.text,
          'name': fullName.text,
          'country': country.text,
          'image': "",
          'zodiac': "",
          'dob': "",
          'uid': FirebaseAuth.instance.currentUser!.uid,
          "isMale": true,
          "joiningDate": DateTime.now().millisecondsSinceEpoch
        });
      }).then((value) async {
        await FirebaseAuth.instance.currentUser!
            .sendEmailVerification()
            .then((value) {
          return showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Email Verification'),
                    content: const Text(
                        'Kindly verify your email to continue.After verification kindly go to login screen to for login'),
                    actions: [
                      TextButton(
                        child: const Text("Login"),
                        onPressed: () {
                          NavigationHelper.pushReplacement(
                              context, LoginView());
                        },
                      )
                    ],
                  ));
        });
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
