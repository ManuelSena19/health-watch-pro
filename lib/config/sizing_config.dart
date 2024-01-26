import 'package:flutter/material.dart';

double verticalConverterLarge(double value, BuildContext context){
  double height = MediaQuery.of(context).size.height;
  double heightRatio = height / 720;
  double newValue = heightRatio * value;
  return newValue;
}

double horizontalConverterLarge(double value, BuildContext context){
  double width = MediaQuery.of(context).size.width;
  double widthRatio = width / 1280;
  double newValue = widthRatio * value;
  return newValue;
}