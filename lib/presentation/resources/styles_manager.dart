import 'package:flutter/material.dart';

import 'font_manger.dart';

TextStyle _getTextStyle(
    String fontFamily,
    double fontSize,
    FontWeight fontWeight,
    Color color,
    ){
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  required String fontFamily,
}){
  return _getTextStyle(fontFamily, fontSize, FontWeightManager.bold, color);
}

// semiBold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  required String fontFamily,
}){
  return _getTextStyle(fontFamily, fontSize, FontWeightManager.semiBold, color);
}