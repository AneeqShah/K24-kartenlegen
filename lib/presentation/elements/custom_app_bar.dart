import 'package:flutter/material.dart';

import '../../config/front_end_config.dart';
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
    backgroundColor: FrontEndConfigs.bgColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
