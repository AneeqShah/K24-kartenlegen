import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';
import 'package:k24/presentation/views/product_detail/layout/product_detail_body.dart';
import '../../../config/front_end_config.dart';

class ProductDetailView extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final String minRange;
  final String maxRange;
  final String productID;
  final bool isFree;

  const ProductDetailView(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.minRange,
      required this.maxRange,
      required this.productID,
      required this.isFree});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,

      appBar: customAppBar('Product', showIcon: true),
      body: ProductDetailBody(
        image: widget.image,
        title: widget.title,
        price: widget.price,
        description: widget.description,
        minRange: widget.minRange,
        maxRange: widget.maxRange,
        productID: widget.productID,
        isFree: widget.isFree,
      ),
    );
  }
}
