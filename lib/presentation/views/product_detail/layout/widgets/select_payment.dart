import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

import '../../../../elements/custom_textfield.dart';

class SelectPayment extends StatelessWidget {
  final TextEditingController controller;
  final Function onApple;
  final Function onPaypal;

  const SelectPayment(
      {super.key,
      required this.controller,
      required this.onApple,
      required this.onPaypal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Ask your Question?',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 5,
            ),
            AuthTextField(hint: 'Write your question here..', controller: controller),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Select payment'
                  'Method',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  onPressed: () => onApple(),
                  text: 'Apple Pay',
                  fontSize: 11,
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: AppButton(
                  onPressed: () => onPaypal(),
                  text: 'PayPal',
                  fontSize: 11,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
