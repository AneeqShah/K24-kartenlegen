import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/product_detail/layout/widgets/select_payment.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'One Question',
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              CustomText(text: '€ 0')
            ],
          ),
          CustomText(text: 'Range',fontSize: 13,fontWeight: FontWeight.w400,),
          CustomText(text: '100 to 200 words',fontWeight: FontWeight.w400,fontSize: 13,),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: 'Description',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
              text: 'Lorem Ipsum is simply dummy text of the printing and'
                  'typesetting industry. Lorem Ipsum has been the industry’s'
                  'standard dummy text ever since the 1500s, when an'
                  'unknown printer took a galley of type and scrambled it'
                  'to make a type specimen book. It has survived not only'
                  'five centuries, but also the leap into electronic typesetting'
                  'remaining essentially unchanged. It was popularised in'
                  'the 1960s with the release of Letraset sheets containing'
                  'Lorem Ipsum passages, and more recently with desktop'
                  'publishing software like Aldus PageMaker including'
                  'versions of Lorem Ipsum.',
          fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.9,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          SizedBox(height: 10,),
          SelectPayment()
        ],
      ),
    );
  }
}
