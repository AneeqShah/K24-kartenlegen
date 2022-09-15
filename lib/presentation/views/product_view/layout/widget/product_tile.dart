import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class ProductTile extends StatelessWidget {
String title;
String subtitle;

ProductTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
              CustomText(text: title),  
              CustomText(text: subtitle),
                SizedBox(height: 20,),
              ],
            ),
            CustomText(text: '€ 0')
          ],
        ),
      ),
    );
  }
}
