
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/views/auth/login/login_view.dart';
import 'package:k24/presentation/views/splash/layout/splash_body.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      NavigationHelper.pushRoute(context, LoginView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FrontEndConfigs.kBgColor,
      body: SplashBody(),
    );
  }
}