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
              text: 'Anmeldung',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
              text: 'Erstellen Sie ein Konto,\num fortzufahren',
              fontSize: 11,
              fontWeight: FontWeight.w300,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomText(text: 'Vollständiger Name'),
            AuthTextField(hint: 'John Wick', controller: fullName),
            const SizedBox(
              height: 15,
            ),
            CustomText(text: 'Land'),
            AuthTextField(hint: 'US', controller: country),
            const SizedBox(
              height: 15,
            ),
            CustomText(text: 'Email'),
            AuthTextField(hint: 'Benutzer@gmail.com', controller: emailController),
            const SizedBox(
              height: 15,
            ),
            CustomText(text: 'Passwort'),
            AuthTextField(hint: '**********', controller: pwdController),
            const SizedBox(
              height: 30,
            ),
            AppButton(
                onPressed: () {
                  if (fullName.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Vollständiger Name darf nicht leer sein");
                  } else if (country.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Land darf nicht leer sein");
                  } else if (emailController.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Email kann nicht leer sein");
                  } else if (pwdController.text.trim() == "") {
                    Fluttertoast.showToast(msg: "Das Passwort darf nicht leer sein");
                  } else {
                    _signupUser();
                  }
                },
                text: 'Anmeldung'),
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
                    title: const Text('E-Mail-Verifizierung'),
                    content: const Text(
                        'Bitte bestätigen Sie Ihre E-Mail-Adresse, um fortzufahren. Gehen Sie nach der Bestätigung zum Anmeldebildschirm, um sich anzumelden'),
                    actions: [
                      TextButton(
                        child: const Text("Anmeldung"),
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
