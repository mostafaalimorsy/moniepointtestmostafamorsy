// ignore_for_file: constant_identifier_names, non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

abstract class ColorsManager {
  // * primary colors over app

  static const Color black = Color(0xFF232220);
  static const Color orange = Color(0xFFfc9e12);
  static const Color grey = Color(0xFFa5957e);
  static const Color white = Color(0xFFffffff);

  static LinearGradient scaffoldBackground = LinearGradient(
    colors: [
      grey.withOpacity(0.1),
      orange.withOpacity(0.4),
    ],
    begin: Alignment.topLeft, // Gradient starting point
    end: Alignment.bottomRight, // Gradient ending point
  );
}
