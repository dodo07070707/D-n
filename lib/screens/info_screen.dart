import 'package:d_n/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_n/theme/color_theme.dart';
import 'package:d_n/theme/text_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:d_n/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    super.initState();
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
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: screenWidth / 430 * 24,
                ),
              ),
              SizedBox(height: screenHeight / 932 * 14),
              CustomText(text: 'Making Time', style: DNTextTheme.SettingMenu),
              SizedBox(height: screenHeight / 932 * 16),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenWidth / 430 * 16),
                        CustomText(
                            text: 'Design',
                            style: DNTextTheme.SettingListPhrase),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: '1h 33m 43m',
                            style: DNTextTheme.SettingListPhrase),
                        SizedBox(width: screenWidth / 430 * 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight / 932 * 10),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenWidth / 430 * 16),
                        CustomText(
                            text: 'Develop',
                            style: DNTextTheme.SettingListPhrase),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: '1h 33m 43m',
                            style: DNTextTheme.SettingListPhrase),
                        SizedBox(width: screenWidth / 430 * 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight / 932 * 46),
              CustomText(text: 'Contact', style: DNTextTheme.SettingMenu),
              SizedBox(height: screenHeight / 932 * 16),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenWidth / 430 * 16),
                        CustomText(
                            text: 'Instagram',
                            style: DNTextTheme.SettingListPhrase),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: '@d0_.yxn_',
                            style: DNTextTheme.SettingListPhrase),
                        SizedBox(width: screenWidth / 430 * 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight / 932 * 10),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenWidth / 430 * 16),
                        CustomText(
                            text: 'E-mail',
                            style: DNTextTheme.SettingListPhrase),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'devdoyun@gmail.com',
                            style: DNTextTheme.SettingListPhrase),
                        SizedBox(width: screenWidth / 430 * 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight / 932 * 10),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenWidth / 430 * 16),
                        CustomText(
                            text: 'Github',
                            style: DNTextTheme.SettingListPhrase),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'dodo07070707',
                            style: DNTextTheme.SettingListPhrase),
                        SizedBox(width: screenWidth / 430 * 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
