import 'package:flutter/material.dart';
import 'package:k24/presentation/views/home/layout/home_body.dart';
import '../../../config/front_end_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,
      body: HomeBody(),
    );
  }
}
