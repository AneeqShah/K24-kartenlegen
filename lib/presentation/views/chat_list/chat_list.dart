import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/presentation/elements/custom_app_bar.dart';

import 'layout/chat_body.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Gespräch'),
      backgroundColor: FrontEndConfigs.bgColor,
      body: ChatListBody(),
    );
  }
}
