import 'package:flutter/material.dart';
import 'package:k24/presentation/views/home/layout/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: HomeBody(),
    );
  }
}
