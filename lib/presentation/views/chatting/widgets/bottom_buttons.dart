import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomText(
                  text:
                      'Thanks for buying my service. Are you satisfied by Our Service',
              fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: AppButton(onPressed: () {  }, text: 'Customer Support',
                  fontSize: 11,
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: AppButton(onPressed: () {  }, text: 'Yes Thanks',
               fontSize: 11,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
