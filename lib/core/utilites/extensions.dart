// ignore_for_file: unused_element

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../config/app_export/app_export.dart';


extension IntExtension on int {
  Duration get milliseconds => Duration(milliseconds: this);
  bool isSuccessful() => this >= 200 && this <= 206;
  double get h => getVerticalSize(toDouble());
  double get w => getHorizontalSize(toDouble());
  double get r => getVerticalSize(toDouble());

  SizedBox get vs => SizedBox(height: h);
  SizedBox get hs => SizedBox(width: w);
}

extension BullBoolExtension on bool? {
  /* null false , false false */
  bool get validate => this == null ? false : this!;
}

extension BoolExtension on bool {
  /* null false , false false */
  bool get isFalse => this == false;
  bool get isTrue => this == true;
}

extension ListExtension on List<dynamic>? {
  List<dynamic> get validate => this == null ? [] : this!;
}

/* json decode and encode*/
extension MapExtension on Map<String, dynamic> {}

extension DateTimeExtension on DateTime? {
  /*validate*/
  /* string to date time */
  /* formate */
}

extension DynamicExtension on dynamic {
  Map<String, dynamic> get json => jsonDecode(this);
  isEqualTo(value) => this == value;
  isNotEqualTo(value) => this != value;
}

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension DoubleExtension on double {
  double get h => getVerticalSize(this);
  double get w => getHorizontalSize(this);
  double get r => getVerticalSize(this);

  SizedBox get vs => SizedBox(height: h);
  SizedBox get hs => SizedBox(width: w);
// double get w=>getSize(this);
}
