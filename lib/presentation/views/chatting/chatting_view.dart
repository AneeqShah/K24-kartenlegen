import 'package:flutter/material.dart';


import 'package:k24/presentation/elements/custom_app_bar.dart';

import 'layout/chatting_body.dart';

import '../../../config/front_end_config.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: FrontEndConfigs.bgColor,

      appBar: customAppBar('',showIcon: true),
      body: ChatViewBody(),
    );
  }



}