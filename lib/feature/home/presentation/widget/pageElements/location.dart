import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';

import '../../../../../config/app_export/app_export.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(all: 15),
      padding: getPadding(all: 10),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on_rounded,
            color: Colors.grey,
          ),
          AutoSizeText(
            "Saint Petersburg",
            style: TextManagerStyle.kTextStyle16(weight: "m", color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
