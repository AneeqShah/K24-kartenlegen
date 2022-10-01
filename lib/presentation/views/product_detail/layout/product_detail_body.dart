import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:k24/app/Custom_image_container.dart';
import 'package:k24/app/custom_loader.dart';
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
  String userID = FirebaseAuth.instance.currentUser!.uid;
  TextEditingController _question = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      isLoading: isLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomImageContainer(
                  height: 200,
                  wight: MediaQuery.of(context).size.width,
                  radius: 8,
                  image: widget.image),
              const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              SelectPayment(
                controller: _question,
                onApple: () {
                  _confirmOrder();
                },
                onPaypal: () {},
                maxLenght: int.parse(widget.maxRange),
              )
            ],
          ),
        ),
      ),
    );
  }

  _confirmOrder() async {
    try {
      loadingTrue();
      String orderID = FirebaseFirestore.instance.collection("order").doc().id;
      await FirebaseFirestore.instance.collection("order").doc(orderID).set({
        "orderID": orderID,
        "customerID": userID,
        "min": widget.minRange,
        "max": widget.maxRange,
        "title": widget.title,
        "askedQuestion": _question.text,
        "orderTime": DateTime.now().millisecondsSinceEpoch,
        "isAnswered": false,
        "price": widget.price,
      }).then((value) async {
        String chatID = FirebaseFirestore.instance
            .collection("chat")
            .doc(orderID)
            .collection("messages")
            .doc()
            .id;
        await FirebaseFirestore.instance
            .collection("questions")
            .doc(userID)
            .collection("chat")
            .doc(chatID)
            .set({
          "userID": userID,
          "question": _question.text,
          "orderID": orderID,
          "chatID": chatID,
          "time": DateTime.now().millisecondsSinceEpoch,
        }).then((value) async {
          String graphID =
              FirebaseFirestore.instance.collection("graph").doc().id;
          await FirebaseFirestore.instance
              .collection("graph")
              .doc(graphID)
              .set({
            "price": widget.price,
            "customerID": userID,
            "graphID": graphID
          }).then((value) {
            loadingFalse();
            print("Finished");
          });
        });
      });
    } on FirebaseException catch (e) {
      loadingFalse();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  loadingTrue() {
    isLoading = true;
    setState(() {});
  }

  loadingFalse() {
    isLoading = false;
    setState(() {});
  }

  _sendChat() {}
}
