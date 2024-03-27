// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../config/app_export/app_export.dart';

class CustomBackground extends StatelessWidget {
  final Widget? child;
  const CustomBackground({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(gradient: ColorsManager.scaffoldBackground),
      child: SafeArea(child: child!),
    );
  }
}
