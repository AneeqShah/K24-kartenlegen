import 'package:flutter/material.dart';

import 'custom_text.dart';

customAppBar(
  String text, {
  bool showIcon = false,
}) {
  return AppBar(
    title: CustomText(
      text: text,
      color: Colors.black,
    ),
    centerTitle: true,
    automaticallyImplyLeading: showIcon ? true : false,
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
