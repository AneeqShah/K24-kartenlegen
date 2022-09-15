import 'package:flutter/material.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/views/product_detail/product_detail_view.dart';
import 'package:k24/presentation/views/product_view/layout/widget/product_tile.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (){
              NavigationHelper.pushRoute(context, ProductDetailView());
            },
            child
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
              child: ProductTile(title: 'First question for free',
                  subtitle: 'Range: 100 to 200 words'),
            ),
          );
        }),
      ),
    );
  }
}
