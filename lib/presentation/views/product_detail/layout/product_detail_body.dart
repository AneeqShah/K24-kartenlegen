import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:k24/app/Custom_image_container.dart';
import 'package:k24/app/custom_loader.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/views/product_detail/layout/widgets/select_payment.dart';
import '../../confirm_order/confirm_order_screen.dart';
import 'package:http/http.dart' as http;

class ProductDetailBody extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final String minRange;
  final String maxRange;
  final String productID;
  final bool isFree;

  const ProductDetailBody(
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
                onFree: () async {
                  _confirmOrder();
                },
                onStripe: () async {
                  print("called");
                 await makePayment(widget.price).then((value) async {
                    await _confirmOrder();
                  });
                },
                maxLenght: int.parse(widget.maxRange),
                isFree: widget.isFree,
              ),
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
        "price": widget.isFree ? "0" : widget.price,
      }).then((value) async {
        FirebaseFirestore.instance
            .collection("chatList")
            .doc("NaupTnYfJcXauqE54QtRm0n9yPV2")
            .collection("users")
            .doc(userID)
            .set({
          "customerID": userID,
          "isAnswered": false,
          "time": DateTime.now().millisecondsSinceEpoch
        }, SetOptions(merge: true));
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
          "isImage": false,
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
            FirebaseFirestore.instance.collection("Users").doc(userID).set({
              "firstQuestion": false,
            }, SetOptions(merge: true)).then((value) {
              loadingFalse();
              NavigationHelper.pushReplacement(
                  context, const ConfirmOrderScreen());
            });
          });
        });
      });
    } on FirebaseException catch (e) {
      loadingFalse();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Map<String, dynamic>? paymentIntentData;

  Future<bool> makePayment(String payment) async {
    try {
      paymentIntentData = await createPaymentIntent(
          "${payment}", 'EUR'); //json.decode(response.body);
      return await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  applePay: true,
                  googlePay: true,
                  testEnv: true,
                  style: ThemeMode.dark,
                  merchantCountryCode: 'EUR',
                  merchantDisplayName: 'K24'))
          .then((value) {
        return displayPaymentSheet(
          context,
        );
      });

      ///now finally display payment sheeet

    } catch (e, s) {
      print(e.toString());

      return Future.value(false);
      print('exception:$e$s');
    }
  }

  Future<bool> displayPaymentSheet(
    BuildContext context,
  ) async {
    try {
      print("paymentttt sheettt");
      return await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        //orderPlaceApi(paymentIntentData!['id'].toString());

        paymentIntentData = null;
        return Future.value(true);
      }).onError((error, stackTrace) {
        loadingFalse();
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
        return Future.value(false);
      });
    } on StripeException catch (e) {
      loadingFalse();
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
      return Future.value(false);
    } catch (e) {
      loadingFalse();
      print('HI $e');
      return Future.value(false);
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51Ln3A4HdUEl3CEFmy89WdHGUM2eQCxFvxIgJgyOEZsg6m8T93bz5k5NepIvBVCl9di8iQxYRxZuNCysvv0mATSEw00Fs7M28Pv',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
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
}
