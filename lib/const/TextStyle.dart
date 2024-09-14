import 'package:flutter/material.dart';
import 'package:music_box/const/color.dart';

const regular = "Regular";
const bold = "Bold";
const semiBold = "SemiBold";
const light = "Light";
const thin = "Thin";

ourTextStyle({double? fontSize = 14.0, color = darkColor, fontFamily = regular,double? letterSpacing = 0.0}){
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing
  );
}