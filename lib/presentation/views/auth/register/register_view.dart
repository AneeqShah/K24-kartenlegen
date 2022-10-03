import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/auth/register/layout/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: 'Already have an account.'),
              CustomText(text: 'Log In',color: FrontEndConfigs.kPrimaryColor,),
            ],
          ),
        ),
      ),
      body: RegisterBody(),
    );
  }
}
