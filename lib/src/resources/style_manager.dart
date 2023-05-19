import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle regularTextStyle({
  double? fontSize,
  required Color color,
  required String fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    fontFamily,
    FontWeightManager.regular,
    color,
  );
}

TextStyle lightTextStyle({
  double? fontSize,
  required Color color,
  required String fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    fontFamily,
    FontWeightManager.light,
    color,
  );
}

TextStyle mediumTextStyle({
  double? fontSize,
  required Color color,
  required String fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    fontFamily,
    FontWeightManager.medium,
    color,
  );
}

TextStyle semiBoldTextStyle({
  double? fontSize,
  required Color color,
  required String fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    fontFamily,
    FontWeightManager.semiBold,
    color,
  );
}

TextStyle boldTextStyle({
  double? fontSize,
  required Color color,
  required String fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    fontFamily,
    FontWeightManager.bold,
    color,
  );
}
