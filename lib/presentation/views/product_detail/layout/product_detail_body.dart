import 'package:flutter/material.dart';
import 'package:k24/app/Custom_image_container.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/product_detail/layout/widgets/select_payment.dart';

class ProductDetailBody extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final String minRange;
  final String maxRange;
  final String productID;

  const ProductDetailBody(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.minRange,
      required this.maxRange,
      required this.productID});

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CustomImageContainer(
                height: 200,
                wight: MediaQuery.of(context).size.width,
                radius: 8,
                image: widget.image),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(text: '€ ${widget.price}')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Range',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
            CustomText(
              text: '${widget.minRange} to ${widget.maxRange} words',
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
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
              text: widget.description,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.9,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            SizedBox(
              height: 10,
            ),
            SelectPayment()
          ],
        ),
      ),
    );
  }
}
