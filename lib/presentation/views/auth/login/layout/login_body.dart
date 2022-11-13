import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/elements/custom_textfield.dart';
import 'package:k24/presentation/views/bottom_nav_bar/bottom_nav_bar.dart';

import '../../../../../app/custom_loader.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      isLoading: isLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: SizedBox(
                      height: 200,
                      width: 250,
                      child: Image.asset('assets/images/tranparentLogo.png'))),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Einloggen',
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Willkommen zu Kartenlegen24\nMelden Sie sich an, um fortzufahren',
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomText(text: 'Email'),
              AuthTextField(hint: 'Benutzer@gmail.com', controller: emailController),
              const SizedBox(
                height: 15,
              ),
              CustomText(text: 'Passwort'),
              AuthTextField(hint: '**********', controller: passwordController),
              // const SizedBox(
              //   height: 10,
              // ),
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: CustomText(
              //       text: 'Passwort vergessen?',
              //       fontWeight: FontWeight.w500,
              //     )),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                  onPressed: () {
                    if (emailController.text.trim() == "") {
                      Fluttertoast.showToast(msg: "E-Mail darf nicht leer sein");
                    } else if (passwordController.text.trim() == "") {
                      Fluttertoast.showToast(msg: "Das Passwort darf nicht leer sein");
                    } else {
                      userLogin();
                    }
                  },
                  text: 'Anmeldung'),
            ],
          ),
        ),
      ),
    );
  }

  userLogin() async {
    try {
      loadingTrue();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        NavigationHelper.pushRoute(context, const BottomNavBody());
      });
    } on FirebaseException catch (e) {
      loadingFalse();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  _checkVerification() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      NavigationHelper.pushReplacement(context, BottomNavBody());
    } else {
      loadingFalse();
      FirebaseAuth.instance.signOut();
      return showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('E-Mail nicht verifiziert'),
                content: const Text('Bitte bestätigen Sie Ihre E-Mail, um fortzufahren'),
                actions: [
                  TextButton(
                    child: const Text("Absagen"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
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
