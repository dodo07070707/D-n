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
        Color.fromARGB(255, 51, 51, 51),
        Colors.black,
        Colors.black,
      ],
    ),
    shape: LinearBorder(),
  );
}
