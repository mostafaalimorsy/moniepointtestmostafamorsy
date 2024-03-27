import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';

import '../../../../../config/app_export/app_export.dart';

class WelcomeMsg extends StatelessWidget {
  const WelcomeMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(all: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Hi, Marina",
            style: TextManagerStyle.kTextStyle24(weight: "m", color: Colors.grey),
          ),
          5.vs,
          SizedBox(
            width: 200.w,
            child: AutoSizeText(
              "let's select your prefct place",
              maxLines: 2,
              style: TextManagerStyle.kTextStyle34(weight: "m", color: ColorsManager.black),
            ),
          ),
        ],
      ),
    );
  }
}
