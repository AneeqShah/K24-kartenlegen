import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class SelectPayment extends StatelessWidget {
  const SelectPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
              'Select payment'
              'Method',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: AppButton(onPressed: () {  }, text: 'Apple Pay',
                  fontSize: 11,
                )),
                SizedBox(width: 10,),
                Expanded(child: AppButton(onPressed: () {  }, text: 'PayPal',
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