import 'package:flutter/material.dart';


class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/images/tranparentLogo.png',)),
    );
  }
}