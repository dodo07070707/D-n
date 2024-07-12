import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ABColors.MAIN_THEME,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight / 844 * 391),
                Image.asset(
                  'assets/images/logo_white_new.png',
                  width: 53.04,
                  height: 62,
                ),
              ],
            ),
            Column(
              children: [
                CustomText(
                  text: 'Copyright 2023. Abibo All rights reserved',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.30000001192092896),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 20,
                  ),
                ),
                SizedBox(height: screenHeight / 844 * 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
