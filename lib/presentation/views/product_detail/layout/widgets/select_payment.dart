import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

import '../../../../elements/custom_textfield.dart';

class SelectPayment extends StatelessWidget {
  final TextEditingController controller;
  final Function onFree;
  final Function onStripe;
  final int maxLenght;
  final bool isFree;

  const SelectPayment(
      {super.key,
      required this.controller,
      required this.onFree,
      required this.onStripe,
      required this.maxLenght,
      required this.isFree});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FrontEndConfigs.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Stell deine Frage?',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffF0F0F0)),
              child: TextField(
                controller: controller,
                maxLength: maxLenght,
                maxLines: 3,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  border: InputBorder.none,
                  hintText: "Schreiben Sie hier Ihre Frage",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Zahlungsmethode\nauswählen',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 10,
            ),
            isFree
                ? AppButton(onPressed: () => onFree(), text: "Kostenlos anfragen")
                : AppButton(onPressed: () => onStripe(), text: "Weiter bezahlen")
          ],
        ),
      ),
    );
  }
}
