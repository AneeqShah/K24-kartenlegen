import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:k24/presentation/views/payment/widget/payment_card.dart';
import '../../../config/front_end_config.dart';

import '../../../app/custom_loader.dart';
import '../../elements/custom_app_bar.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  bool isLoading = false;
  String userID = FirebaseAuth.instance.currentUser!.uid;
  List<DocumentSnapshot> allHistory = [];

  @override
  void initState() {
    // TODO: implement initState
    _getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: customAppBar("Geschichte", showIcon: true),
        backgroundColor: FrontEndConfigs.bgColor,
        body: _getUI(context),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: allHistory.length,
          itemBuilder: (context, i) {
            DateTime time = DateTime.fromMillisecondsSinceEpoch(
                allHistory[i]["orderTime"]);
            var uploadTime = Jiffy(time).MMMEd;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 5),
              child: PaymentCard(
                question: allHistory[i]["askedQuestion"],
                price: allHistory[i]["price"],
                date: uploadTime,
              ),
            );
          }),
    );
  }

  _getHistory() async {
    await FirebaseFirestore.instance
        .collection("order")
        .where("customerID", isEqualTo: userID)
        .orderBy("orderTime", descending: true)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
          allHistory.clear();
      snapshot.docs.forEach((element) {
        allHistory.add(element);
      });
      setState(() {});
    });
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
