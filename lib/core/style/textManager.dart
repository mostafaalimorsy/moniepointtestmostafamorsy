// ignore_for_file: constant_identifier_names, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import '../../config/app_export/app_export.dart';

abstract class TextManagerStyle {
  /*
    *font weight:
    ** b=> bold
    ** r=> regular
    ** m=> medium 
    ** sb=> semiBold 

    *font Family:  =>>>
    ** title
    ** subtitle
    ** logo
    ** sologan
    ** AppBar Title

   */

  static FontWeight KBold = FontWeight.w700;
  static FontWeight KSemiBold = FontWeight.w600;
  static FontWeight KRegular = FontWeight.normal;
  static FontWeight KMedium = FontWeight.w500;

//*function to manage the font weight
  static checkFontWeight(weight) {
    switch (weight) {
      case "b":
        return KBold;
      case "r":
        return KRegular;
      case "m":
        return KMedium;
      case "sb":
        return KSemiBold;
      default:
        return KRegular;
    }
  }

//*function to select
  static TextStyle kTextStyle12({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 12,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle13({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 13,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle14({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 14,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle16({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 16,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle18({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 18,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle20({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 20,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle24({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 24,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle32({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 32,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle34({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 34,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle35({
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 35,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }

  static TextStyle kTextStyle36({
    //*for size 36
    weight,
    family,
    color,
  }) {
    return TextStyle(
        fontSize: 35,
        fontWeight: checkFontWeight(weight),
        fontFamily: FontsFamilyManager.main,
        color: color ?? Colors.white);
  }
}
