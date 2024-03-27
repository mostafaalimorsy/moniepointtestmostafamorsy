// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import '../config/app_export/app_export.dart';

class NavigatorManager {
  static void pushPage({context, path}) => Navigator.of(AppService().getContext).pushNamed(path);
  static void popPage({
    context,
  }) =>
      Navigator.pop(AppService().getContext);
  static void popUntilPage({context, path}) => Navigator.popUntil(AppService().getContext, ModalRoute.withName(path));
  static void pushReplacementPage({context, path}) =>
      Navigator.pushNamedAndRemoveUntil(AppService().getContext, path, (route) => false);
}
