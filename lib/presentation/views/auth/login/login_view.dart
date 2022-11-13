import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/auth/login/layout/login_body.dart';
import 'package:k24/presentation/views/auth/register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: GestureDetector(
          onTap: (){
            NavigationHelper.pushRoute(context, const RegisterView());
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: 'Ich habe kein Konto.'),
              CustomText(text: 'Anmeldung',color: FrontEndConfigs.kPrimaryColor,),
            ],
          ),
        ),
      ),
      body: LoginBody(),
    );
  }
}
