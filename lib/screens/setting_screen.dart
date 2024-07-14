import 'package:d_n/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_n/theme/color_theme.dart';
import 'package:d_n/theme/text_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:d_n/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int? year;
  final TextEditingController _controller = TextEditingController();

  void _saveYear() async {
    int? year = int.tryParse(_controller.text);
    if (year != null && 2000 <= year && year <= 3000) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('Year', year);
      Get.snackbar(
        '알림',
        '년도 변경 성공',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white.withOpacity(0.4),
      );
    } else {
      Get.snackbar(
        '알림',
        '알맞는 년도를 입력해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white.withOpacity(0.4),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 430 * 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight / 932 * 65),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const MainScreen());
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: screenWidth / 430 * 24,
                ),
              ),
              SizedBox(height: screenHeight / 932 * 14),
              CustomText(
                  text: 'Your KSAT Year', style: DNTextTheme.SettingMenu),
              SizedBox(height: screenHeight / 932 * 16),
              Container(
                width: screenWidth / 430 * 362,
                height: screenHeight / 932 * 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number, // 숫자만 입력 가능하게 설정
                  textAlign: TextAlign.left,
                  cursorColor: Colors.white.withOpacity(0.5),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          year = int.tryParse(_controller.text);
                        });
                        _saveYear();
                      },
                      child: Icon(
                        Icons.check,
                        color: Colors.white.withOpacity(0.5),
                        size: screenWidth / 430 * 20,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: const OutlineInputBorder(), // 테두리 설정
                    filled: true, // 배경색 채우기
                    fillColor: Colors.transparent, // 배경색 설정
                  ),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontFamily: 'Ydestreet',
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
