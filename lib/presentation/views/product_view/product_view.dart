import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';
import 'package:k24/presentation/views/product_view/layout/product_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Product'),
      body: const ProductBody(),
    );
  }
}
