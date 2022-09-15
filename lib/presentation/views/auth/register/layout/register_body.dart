import 'package:flutter/material.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/elements/custom_textfield.dart';

import '../../../bottom_nav_bar/bottom_nav_bar.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: 'Sign Up',fontSize: 22,fontWeight: FontWeight.w600,),
          const SizedBox(height: 5,),
          CustomText(
            text: 'Create account to continue',
            fontSize: 11,
            fontWeight: FontWeight.w300,
          ),
          const SizedBox(height: 25,),
          CustomText(text: 'Full Name'),
          AuthTextField(hint: 'John Wick', controller: emailController),
          const SizedBox(height: 15,),
          CustomText(text: 'Country'),
          AuthTextField(hint: 'US', controller: emailController),

          const SizedBox(height: 15,),
          CustomText(text: 'Email'),
          AuthTextField(hint: 'user@gmail.com', controller: emailController),
          const SizedBox(height: 15,),
          CustomText(text: 'Password'),
          AuthTextField(hint: '**********', controller: pwdController),
          const SizedBox(height: 30,),

          AppButton(onPressed: (){
            NavigationHelper.pushRoute(context, BottomNavBody());
          }, text: 'Sign Up'),
        ],
      ),
    );
  }
}
