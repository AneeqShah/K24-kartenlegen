import 'package:flutter/material.dart';


import 'package:k24/presentation/elements/custom_app_bar.dart';

import 'layout/chatting_body.dart';


class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar('Question # 1',showIcon: true),
      body: ChatViewBody(),
    );
  }
}