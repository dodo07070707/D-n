import 'package:flutter/material.dart';
import 'package:d_n/theme/color_theme.dart';
import 'package:d_n/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:d_n/widgets/custom_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? year;
  int? diffday;

  @override
  void initState() {
    super.initState();
    loadSavedYear();
  }

  Future<void> loadSavedYear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      year = prefs.getInt('Year');
      calculateDifference(year!);
    });
  }

  void calculateDifference(int year) {
    DateTime today = DateTime.now().toLocal();
    DateTime? targetDate;
    for (var date in dateArray) {
      if (date.year == year) {
        targetDate = date;
        break;
      }
    }
    if (targetDate != null) {
      Duration difference = today.difference(targetDate);
      diffday = difference.inDays;
    }
    print(diffday);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: GradientDesign.BlackGradient,
        child: Column(
          children: [
            SizedBox(height: screenHeight / 932 * 390),
            CustomText(
                text: diffday == null
                    ? 'Loading...'
                    : diffday == 0
                        ? 'D-Day'
                        : diffday! > 0
                            ? 'D+${diffday!}'
                            : 'D${diffday! - 1}',
                style: DNTextTheme.MainMain),
            CustomText(
              text: 'Your Better Than You Think.',
              style: DNTextTheme.MainSub,
            ),
            SizedBox(height: screenHeight / 932 * 360),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh_outlined,
                  color: Colors.white,
                  size: screenWidth / 430 * 20,
                ),
                SizedBox(width: screenWidth / 430 * 10),
                Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: screenWidth / 430 * 20,
                ),
                SizedBox(width: screenWidth / 430 * 10),
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: screenWidth / 430 * 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<DateTime> dateArray = [
  DateTime(2024, 11, 14),
  DateTime(2025, 11, 13),
  DateTime(2026, 11, 13),
  DateTime(2027, 11, 13),
  DateTime(2028, 11, 13),
  DateTime(2029, 11, 13),
  DateTime(2030, 11, 13),
  DateTime(2031, 11, 13),
  DateTime(2032, 11, 13),
  DateTime(2033, 11, 13),
];
