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
  String? nowphrase;
  int? isAlert;
  int? isPhrase;
  int? isColor;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _phrasecontroller = TextEditingController();
  List<String> stringArray = [];

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

  void _savePhrase() async {
    if (nowphrase != null) {
      stringArray.add(nowphrase!);
      _phrasecontroller.clear();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('stringArray', stringArray);
      Get.snackbar(
        '알림',
        '격언 추가 성공',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white.withOpacity(0.4),
      );
    } else {
      Get.snackbar(
        '알림',
        '알맞는 격언을 입력해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white.withOpacity(0.4),
      );
    }
  }

  Future<void> _getStringArrayFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedArray = prefs.getStringList('stringArray');
    setState(() {
      stringArray = savedArray ?? [];
    });
  }

  Future<void> _loadSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isAlert = prefs.getInt('isAlert');
      isPhrase = prefs.getInt('isPhrase');
      isColor = prefs.getInt('isColor');
    });
  }

  Future<void> _saveSetting(int isAlert, int isPhrase, int isColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('isAlert', isAlert);
    await prefs.setInt('isPhrase', isPhrase);
    await prefs.setInt('isColor', isColor);
  }

  @override
  void initState() {
    super.initState();
    _getStringArrayFromSharedPreferences();
    _loadSetting();
  }

  @override
  void dispose() {
    _controller.dispose();
    _phrasecontroller.dispose();
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
          padding: EdgeInsets.fromLTRB(screenWidth / 430 * 34, 0,
              screenWidth / 430 * 34, screenHeight / 932 * 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight / 932 * 65),
                GestureDetector(
                  onTap: () async {
                    await _saveSetting(
                        isAlert ?? 1, isPhrase ?? 1, isColor ?? 1);
                    await Get.offAll(() => const MainScreen());
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
                SizedBox(height: screenHeight / 932 * 46),
                CustomText(
                    text: 'Alert Status', style: DNTextTheme.SettingMenu),
                SizedBox(height: screenHeight / 932 * 16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAlert = 1;
                        });
                        Get.snackbar(
                          '알림',
                          '알림이 켜졌습니다.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white.withOpacity(0.4),
                        );
                      },
                      child: Container(
                        width: screenWidth / 430 * 170,
                        height: screenHeight / 932 * 40,
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
                        child: Center(
                          child: CustomText(
                            text: 'ON',
                            style: DNTextTheme.SettingButton,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth / 430 * 22),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAlert = 0;
                        });
                        Get.snackbar(
                          '알림',
                          '알림이 꺼졌습니다.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white.withOpacity(0.4),
                        );
                      },
                      child: Container(
                        width: screenWidth / 430 * 170,
                        height: screenHeight / 932 * 40,
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
                        child: Center(
                          child: CustomText(
                            text: 'OFF',
                            style: DNTextTheme.SettingButton,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 932 * 46),
                CustomText(
                    text: 'Pharase Reset', style: DNTextTheme.SettingMenu),
                SizedBox(height: screenHeight / 932 * 16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhrase = 1;
                        });
                        Get.snackbar(
                          '알림',
                          '격언 새로고침이 켜졌습니다.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white.withOpacity(0.4),
                        );
                      },
                      child: Container(
                        width: screenWidth / 430 * 170,
                        height: screenHeight / 932 * 40,
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
                        child: Center(
                          child: CustomText(
                            text: 'ON',
                            style: DNTextTheme.SettingButton,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth / 430 * 22),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhrase = 0;
                        });
                        Get.snackbar(
                          '알림',
                          '격언 새로고침이 꺼졌습니다.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white.withOpacity(0.4),
                        );
                      },
                      child: Container(
                        width: screenWidth / 430 * 170,
                        height: screenHeight / 932 * 40,
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
                        child: Center(
                          child: CustomText(
                            text: 'OFF',
                            style: DNTextTheme.SettingButton,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 932 * 46),
                CustomText(
                    text: 'Color Change', style: DNTextTheme.SettingMenu),
                SizedBox(height: screenHeight / 932 * 16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isColor = 1;
                        });
                        Get.snackbar(
                          '알림',
                          '배경색 변경이 켜졌습니다.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white.withOpacity(0.4),
                        );
                      },
                      child: Container(
                        width: screenWidth / 430 * 170,
                        height: screenHeight / 932 * 40,
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
                        child: Center(
                          child: CustomText(
                            text: 'ON',
                            style: DNTextTheme.SettingButton,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth / 430 * 22),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isColor = 0;
                        });
                        Get.snackbar(
                          '알림',
                          '배경색 변경이 꺼졌습니다.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white.withOpacity(0.4),
                        );
                      },
                      child: Container(
                        width: screenWidth / 430 * 170,
                        height: screenHeight / 932 * 40,
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
                        child: Center(
                          child: CustomText(
                            text: 'OFF',
                            style: DNTextTheme.SettingButton,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 932 * 46),
                CustomText(text: 'Add Phrase', style: DNTextTheme.SettingMenu),
                SizedBox(height: screenHeight / 932 * 16),
                Column(
                  children: [
                    Container(
                      width: screenWidth / 430 * 362,
                      height: screenHeight / 932 * 40,
                      padding: EdgeInsets.fromLTRB(
                          screenWidth / 430 * 14, 0, screenWidth / 430 * 11, 0),
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
                          controller: _phrasecontroller,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          cursorColor: Colors.white.withOpacity(0.5),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  nowphrase = _phrasecontroller.text;
                                });
                                _savePhrase();
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
                          style: DNTextTheme.SettingPhrase),
                    ),
                    SizedBox(height: screenHeight / 932 * 10),
                    stringArray.isEmpty
                        ? const SizedBox(width: 0, height: 0)
                        : SizedBox(
                            width: screenWidth / 430 * 362,
                            height: screenHeight / 932 * 240,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: stringArray.length,
                              separatorBuilder: (BuildContext ctx, int idx) {
                                return SizedBox(
                                    height: screenHeight / 932 * 10);
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  width: screenWidth / 430 * 362,
                                  height: screenHeight / 932 * 40,
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: screenWidth / 430 * 14),
                                          CustomText(
                                            text: stringArray[index],
                                            style:
                                                DNTextTheme.SettingListPhrase,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.close,
                                            size: screenWidth / 430 * 20,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          SizedBox(
                                              width: screenWidth / 430 * 30),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
