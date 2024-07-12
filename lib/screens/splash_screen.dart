import 'package:d_n/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:d_n/theme/color_theme.dart';
import 'package:d_n/theme/text_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: GradientDesign.BlackGradient,
        child: Column(
          children: [
            SizedBox(height: screenHeight / 932 * 440),
            CustomText(
              text: 'D-n',
              style: DNTextTheme.SplashMain,
            ),
            SizedBox(height: screenHeight / 932 * 330),
            CustomText(
              text: 'Copyright 2024. D-n All rights reserved.',
              style: DNTextTheme.SplashDesc,
            ),
          ],
        ),
      ),
    );
  }
}
