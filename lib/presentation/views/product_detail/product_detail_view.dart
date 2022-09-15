import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';
import 'package:k24/presentation/views/product_detail/layout/product_detail_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Product',showIcon: true),
      body: const ProductDetailBody(),
    );
  }
}
