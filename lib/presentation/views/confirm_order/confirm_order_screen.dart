import 'package:flutter/material.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:lottie/lottie.dart';
import '../../../config/front_end_config.dart';

import '../../elements/custom_app_bar.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('', showIcon: false),
      backgroundColor: FrontEndConfigs.bgColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset('assets/images/payment.json', repeat: false)),
          SizedBox(
            height: 15,
          ),
          CustomText(
            text: "Zahlung erledigt!",
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          SizedBox(
            height: 15,
          ),
          CustomText(
            align: TextAlign.center,
            text:
                "Vielen Dank, dass Sie unsere Dienste nutzen.\nBitte warten Sie, der Berater wird Ihnen innerhalb von 24 Stunden antworten",
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          const SizedBox(
            height: 30,
          ),
          AppButton(
              onPressed: () {
                NavigationHelper.pushReplacement(context, const BottomNavBody());
              },
              text: "Fortsetzen"),
        ],
      ),
    );
  }
}
