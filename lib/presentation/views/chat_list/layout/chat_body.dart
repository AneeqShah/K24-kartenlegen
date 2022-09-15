import 'package:flutter/material.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/views/chat_list/layout/widgets/chat_list_tile.dart';
import 'package:k24/presentation/views/chatting/chatting_view.dart';

class ChatListBody extends StatelessWidget {
  const ChatListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
         NavigationHelper.pushRoute(context, ChatView());
            },
            child: ChatListTile(title: 'Question #1',
                date: '12/sep/2020',
                desc: 'when an unknown printer took a galley of type'
                'and scrambled.'),
          ),
        );
      })),
    );
  }
}
