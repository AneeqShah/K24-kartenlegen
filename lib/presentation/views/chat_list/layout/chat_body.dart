import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/views/chat_list/layout/widgets/chat_list_tile.dart';
import 'package:k24/presentation/views/chatting/chatting_view.dart';

class ChatListBody extends StatefulWidget {
  const ChatListBody({Key? key}) : super(key: key);

  @override
  State<ChatListBody> createState() => _ChatListBodyState();
}

class _ChatListBodyState extends State<ChatListBody> {
  String userID = FirebaseAuth.instance.currentUser!.uid;
  List<DocumentSnapshot> chat = [];

  @override
  void initState() {
    // TODO: implement initState
    _getchat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, i) {
                DateTime time = DateTime.fromMillisecondsSinceEpoch(
                    chat[i]["time"]);
                var uploadTime = Jiffy(time).MMMEd;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      NavigationHelper.pushRoute(context, ChatView());
                    },
                    child: ChatListTile(
                        title: 'Adviser',
                        date: uploadTime,
                        desc: chat[i]["question"]),
                  ),
                );
              })),
    );
  }

  _getchat() async {
    await FirebaseFirestore.instance
        .collection("questions")
        .doc(userID)
        .collection("chat")
        .orderBy("time", descending: true)
        .limit(1)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        chat.add(element);
        setState(() {});
      });
    });
  }
}
