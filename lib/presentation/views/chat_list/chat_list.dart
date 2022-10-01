import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';

import 'layout/chat_body.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Conversation'),
      backgroundColor: Colors.white,
      body: ChatListBody(),
    );
  }
}
