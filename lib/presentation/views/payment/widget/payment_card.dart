import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class PaymentCard extends StatelessWidget {
  final String question;
  final String price;
  final String date;

  const PaymentCard(
      {super.key,
      required this.question,
      required this.price,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Asked question",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: CustomText(
                text: question,
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Price: ",
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text: "E ${price}",
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                CustomText(
                  text: date,
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
