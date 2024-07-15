import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_n/theme/color_theme.dart';
import 'package:d_n/theme/text_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:d_n/widgets/custom_text.dart';
import 'package:d_n/screens/setting_screen.dart';
import 'package:d_n/screens/info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? year;
  int diffday = 0;
  int? isAlert;
  int? isPhrase;
  int? isColor;
  late Color rgbaColor;
  int phrasecount = 0;
  List<String> stringArray = [];
  late DateTime initialAccessDate;
  late int accessCounter;

  @override
  void initState() {
    super.initState();
    loadSavedYear();
    loadSavedString();
    _loadSetting();
    _setbackColor();
  }

  Future<void> _setbackColor() async {
    double hue = diffday < 0 ? diffday / 730 * -360 : diffday / 730 * 360;
    double saturation = 0.67;
    double lightness = 0.17;
    double alpha = 1.0;

    print(diffday);

    // HSL -> RGBA 변환
    rgbaColor = HSLColor.fromAHSL(alpha, hue, saturation, lightness).toColor();
  }

  Future<void> loadSavedYear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      year = prefs.getInt('Year');
      calculateDifference(year!);
    });
  }

  Future<void> loadSavedString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedArray = prefs.getStringList('stringArray');
    setState(() {
      stringArray = savedArray ?? [];
    });
  }

  Future<void> _loadSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isAlert = prefs.getInt('isAlert') ?? 1;
      isPhrase = prefs.getInt('isPhrase') ?? 1;
      isColor = prefs.getInt('isColor') ?? 1;
    });
  }

  void calculateDifference(int year) async {
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
      _setbackColor();
    }
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
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isColor == 1
                  ? (rgbaColor ?? Colors.transparent)
                  : const Color.fromARGB(255, 51, 51, 51),
              Colors.black,
              Colors.black,
            ],
          ),
          shape: const LinearBorder(),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight / 932 * 390),
            CustomText(
                text: diffday == null
                    ? 'Loading...'
                    : diffday == 0
                        ? 'D-Day'
                        : diffday > 0
                            ? 'D+$diffday'
                            : 'D${diffday - 1}',
                style: DNTextTheme.MainMain),
            CustomText(
              text: stringArray.isEmpty
                  ? 'Your Better Than You Think.'
                  : stringArray[phrasecount],
              style: DNTextTheme.MainSub,
            ),
            SizedBox(height: screenHeight / 932 * 360),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (isPhrase == 0)
                    ? const SizedBox(width: 0, height: 0)
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            phrasecount =
                                (phrasecount + 1) % stringArray.length;
                          });
                        },
                        child: Icon(
                          Icons.refresh_outlined,
                          color: Colors.white,
                          size: screenWidth / 430 * 20,
                        ),
                      ),
                SizedBox(width: screenWidth / 430 * 10),
                GestureDetector(
                  onTap: () async {
                    await Get.to(() => const SettingScreen());
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: screenWidth / 430 * 20,
                  ),
                ),
                SizedBox(width: screenWidth / 430 * 10),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const InfoScreen());
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: screenWidth / 430 * 20,
                  ),
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
