import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app/custom_loader.dart';
import '../../../config/front_end_config.dart';
import '../../elements/app_button.dart';
import '../../elements/custom_app_bar.dart';
import '../../elements/custom_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isLoading = false;
  TextEditingController newController = TextEditingController();
  TextEditingController cPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: customAppBar("Change Password", showIcon: true),
        backgroundColor: FrontEndConfigs.bgColor,
        body: _getUI(context),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/tranparentLogo.png')),
            AuthTextField(hint: 'New password', controller: newController),
            const SizedBox(
              height: 15,
            ),
            AuthTextField(hint: 'Confirm password', controller: cPwdController),
            const SizedBox(
              height: 20,
            ),
            AppButton(
                onPressed: () {
                  if (cPwdController.text == newController.text) {
                    _changePassword(cPwdController.text);
                  } else {
                    Fluttertoast.showToast(msg: "Password not match");
                  }
                },
                text: 'Change Password'),
          ],
        ),
      ),
    );
  }

  void _changePassword(String password) async {
    loadingTrue();
    User user = await FirebaseAuth.instance.currentUser!;

    user.updatePassword(password).then((_) {
      cPwdController.clear();
      newController.clear();
      loadingFalse();

      Fluttertoast.showToast(msg: "Successfully changed password");
    }).catchError((error) {
      loadingFalse();
      if ("[firebase_auth/requires-recent-login] This operation is sensitive and requires recent authentication. Log in again before retrying this request." ==
          error.toString()) {
        print(error.toString());
        Fluttertoast.showToast(msg: "Sensitive Data Re-login to continue");
      }
    });
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
