import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Welcome to',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            Image.asset('assets/images/logo2.png'),
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Our Services',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            SizedBox(height: 10,),
            CustomText(text: 'Lorem Ipsum is simply dummy text of the printing and'
              'typesetting industry. Lorem Ipsum has been the industry’s'
              'standard dummy text ever since the 1500s, when an'
              'unknown printer took a galley of type and scrambled it'
              'to make a type specimen book. It has survived not only'
              'five centuries, but also the leap into electronic typesetting,'
              'remaining essentially unchanged. It was popularised in'
              'the 1960s with the release of Letraset sheets containing'
              'Lorem Ipsum passages, and more recently with desktop'
              'publishing software like Aldus PageMaker including'
              'versions of Lorem Ipsum.',
            fontWeight: FontWeight.w300,
              fontSize: 11,
              height: 1.8,
            ),
            SizedBox(height: 20,),
            Divider(),
            SizedBox(height: 20,),
            AppButton(onPressed: (){}, text: 'Advertisement',
            color: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.black,
              height: 55,

            )
          ],
        ),
      ),
    );
  }
}
