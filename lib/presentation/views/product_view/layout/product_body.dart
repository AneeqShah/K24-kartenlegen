import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/views/product_detail/product_detail_view.dart';
import 'package:k24/presentation/views/product_view/layout/widget/product_tile.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  String userID = FirebaseAuth.instance.currentUser!.uid;
  List<DocumentSnapshot> allProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  NavigationHelper.pushRoute(
                      context,
                      ProductDetailView(
                          image: allProducts[i]["image"],
                          title: allProducts[i]["title"],
                          price: allProducts[i]["price"],
                          description: allProducts[i]["description"],
                          minRange: allProducts[i]["min"],
                          maxRange: allProducts[i]["max"],
                          productID: allProducts[i]["productID"]));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: ProductTile(
                    image: allProducts[i]["image"],
                    price: allProducts[i]["price"],
                    title: allProducts[i]["title"],
                    min: allProducts[i]["min"],
                    max: allProducts[i]["max"],
                  ),
                ),
              );
            }),
      ),
    );
  }

  _getProducts() async {
    await FirebaseFirestore.instance
        .collection("products")
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        allProducts.add(element);
      });
      setState(() {});
    });
  }
}
