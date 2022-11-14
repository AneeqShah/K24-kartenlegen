import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/custom_text.dart';
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
  bool isFirstQuestion = false;

  @override
  void initState() {
    // TODO: implement initState
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            isFirstQuestion
                ? InkWell(
                    onTap: () {
                      String prodID = FirebaseFirestore.instance
                          .collection("porID")
                          .doc()
                          .id;
                      NavigationHelper.pushRoute(
                          context,
                          ProductDetailView(
                            image:
                                "https://i.ibb.co/Pt7v7XC/tarot-gf8486537e-1920.jpg",
                            title: "Erste Frage Gratis",
                            price: "FREE",
                            description: "Erste Gratis Frage einlösen",
                            minRange: "100",
                            maxRange: "500",
                            productID: "free-${prodID}",
                            isFree: true,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Erste kostenlose Frage"),
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: FrontEndConfigs.kPrimaryColor),
                                child: Center(
                                    child: CustomText(
                                  text: "Frei",
                                  color: Colors.white,
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(
              height: isFirstQuestion
                  ? MediaQuery.of(context).size.height * 0.7
                  : MediaQuery.of(context).size.height* 0.79,
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
                              productID: allProducts[i]["productID"],
                              isFree: false,
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3),
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
          ],
        ),
      ),
    );
  }

  _getProducts() async {
    await FirebaseFirestore.instance
        .collection("products")
        .orderBy("time", descending: false)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      allProducts.clear();
      snapshot.docs.forEach((element) {
        allProducts.add(element);
      });
      setState(() {});
    });
  }

  _getUserData() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userID)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      isFirstQuestion = snapshot.get("firstQuestion");
      setState(() {});
    });
    _getProducts();
  }
}
