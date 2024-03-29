// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_single_cascade_in_expression_statements, file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/config/app_export/app_export.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';

class RentWidget extends StatefulWidget {
  @override
  _RentWidgetState createState() => _RentWidgetState();
}

class _RentWidgetState extends State<RentWidget> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller?..forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 50, end: 2212),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) => Container(
        width: 170.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          color: ColorsManager.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(top: 6),
              child: AutoSizeText(
                "Rent",
                style: TextManagerStyle.kTextStyle16(weight: "m", color: Colors.grey),
              ),
            ),
            Padding(
              padding: getPadding(top: 20),
              child: AutoSizeText(
                "${value.toInt()}",
                style: TextManagerStyle.kTextStyle40(weight: "b", color: Colors.grey),
              ),
            ),
            Padding(
              padding: getPadding(bottom: 30),
              child: AutoSizeText(
                "offers",
                style: TextManagerStyle.kTextStyle16(weight: "m", color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
