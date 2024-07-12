import 'package:flutter/material.dart';
import 'package:d_n/theme/color_theme.dart';

abstract class DNTextTheme {
  static final SplashMain = TextStyle(
    fontFamily: 'Ydestreet',
    fontSize: 64,
    color: Colors.white,
    letterSpacing: 2,
    shadows: [
      Shadow(
        blurRadius: 10,
        color: Colors.white.withOpacity(0.7),
        offset: const Offset(0, 0),
      ),
    ],
  );
  static final SplashDesc = TextStyle(
    fontFamily: 'Ydestreet',
    fontSize: 12,
    color: Colors.white.withOpacity(0.3),
    letterSpacing: 0,
  );
}
