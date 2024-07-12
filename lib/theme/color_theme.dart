import 'package:flutter/material.dart';

abstract class DnColors {
  static const MAIN_THEME = Colors.black;
}

abstract class GradientDesign {
  static const BlackGradient = ShapeDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF222222),
        Colors.black,
        Colors.black,
      ],
    ),
    shape: LinearBorder(),
  );
}
