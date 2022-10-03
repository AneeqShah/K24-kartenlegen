import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';
import 'package:k24/presentation/views/product_view/layout/product_body.dart';
import '../../../config/front_end_config.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,

      appBar: customAppBar('Product'),
      body: const ProductBody(),
    );
  }
}
