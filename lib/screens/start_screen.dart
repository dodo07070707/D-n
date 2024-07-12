import 'package:flutter/material.dart';
import 'package:d_n/theme/text_theme.dart';
import 'package:d_n/theme/color_theme.dart';
import 'package:d_n/widgets/custom_text.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController _controller = TextEditingController();
  int? year;
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
            SizedBox(height: screenHeight / 932 * 410),
            CustomText(
              text: 'Please Enter Your KSAT Year',
              style: DNTextTheme.StarthMain,
            ),
            SizedBox(height: screenHeight / 932 * 30),
            Container(
              width: screenWidth / 430 * 336,
              height: screenHeight / 932 * 60,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
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
                decoration: InputDecoration(
                  hintText: 'e.g. 2024', // 힌트 텍스트 설정
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 20,
                    height: 4.2,
                    fontFamily: 'Ydestreet',
                  ),
                  border: const OutlineInputBorder(), // 테두리 설정
                  filled: true, // 배경색 채우기
                  fillColor: Colors.black, // 배경색 설정
                ),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5)), // 입력된 텍스트 색상 설정
                onChanged: (text) {
                  setState(() {
                    year = int.tryParse(text); // 입력된 값을 year 변수에 저장
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
