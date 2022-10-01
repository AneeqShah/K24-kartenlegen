import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:k24/presentation/views/chatting/widgets/bottom_buttons.dart';

import '../../../../model/message.dart';
import '../widgets/chat_message.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({Key? key}) : super(key: key);

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

final List<Message> messages = [
  Message(
      0,
      'Lorem Ipsum is simply dummy text of the'
      'printing and typesetting industry. Lorem'
      'Ipsum has been the industry’s'
      'standard dummy text ever since the 1500s,'
      'when an unknown printer took a galley of type'
      'and scrambled it to make a type specimen'
      'book.'),
  Message(
      1,
      'Lorem Ipsum is simply dummy text of the'
      'printing and typesetting industry. Lorem'
      'Ipsum has been the industry’s'
      'standard dummy text ever since the 1500s,'
      'when an unknown printer took a galley of type'
      'and scrambled it to make a type specimen'
      'book.'),
];

class _ChatViewBodyState extends State<ChatViewBody> {
  String userID = FirebaseAuth.instance.currentUser!.uid;
  List<DocumentSnapshot> chat = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _getchat();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10.0);
            },
            reverse: false,
            itemCount: chat.length,
            itemBuilder: (BuildContext context, int index) {
              if (chat[index]["userID"] == userID) {
                return MessageRowWidget(
                  current: true,
                  message: chat[index]["question"],
                );
              }
              return MessageRowWidget(
                current: false,
                message: chat[index]["question"],
              );
            },
          ),
        ),
        ButtomButton(),
      ],
    );
  }

  _getchat() async {
    await FirebaseFirestore.instance
        .collection("questions")
        .doc(userID)
        .collection("chat")
        .orderBy("time", descending: false)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      chat.clear();
      snapshot.docs.forEach((element) {
        chat.add(element);
        setState(() {});
      });
    });
  }
}
