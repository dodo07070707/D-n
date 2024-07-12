import 'package:flutter/material.dart';

abstract class ABColors {
  static const MAIN_THEME = Colors.black;
}

abstract class GradientDesign {
  static const RedGradient = ShapeDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.22],
      colors: [
        Color(0xFF222222),
        Colors.black,
      ],
    ),
    shape: LinearBorder(),
  );
}
