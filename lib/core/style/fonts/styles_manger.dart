import 'package:flutter/material.dart';

import 'font_manger.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily);
}

//regular style

TextStyle getRegularStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManger.regular,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

//bold style
TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: FontWeightManger.bold,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

//light style
TextStyle getLightStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: FontWeightManger.light,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

// medium style
TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManger.medium,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

//semi bold style
TextStyle getSemiBoldStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManger.semiBold,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

//extra bold style
TextStyle getExtraBoldStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManger.extraBold,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

//Extra Light style
TextStyle getExtraLightStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeightManger.extraLight,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}

// black style
TextStyle getBlackStyle(
    {required double fontSize,
    required Color color,
    double? wordSpacing,
    double? height,
    double? letterSpacing,
    fontFamily = FontConsistent.fontFamilyCairo}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManger.black,
      fontFamily: fontFamily,
      color: color,
      wordSpacing: wordSpacing,
      height: height,
      letterSpacing: letterSpacing);
}
