import 'package:flutter/material.dart';

class Sizing {
  static double textSize(BuildContext context, double textSize) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return textSize * screenWidth;
  }
}
