import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

double getProportionalScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  if (screenWidth != null) {
    return (inputWidth * screenWidth) / 414;
  }
  return inputWidth;
}

double getProportionalScreenHeigth(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  if (screenHeight != null) {
    return (inputHeight * screenHeight) / 896;
  }
  return inputHeight;
}
