import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d_n/screens/main_screen.dart';
import 'package:d_n/screens/splash_screen.dart';
import 'package:d_n/screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashScreen = true;
  late Future<int?> _yearFuture;

  @override
  void initState() {
    super.initState();
    _yearFuture = getYear(); // getYear 함수의 Future를 저장
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSplashScreen = false;
        });
      }
    });
  }

  Future<int?> getYear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? year = prefs.getInt('Year');
    return year;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        body: _showSplashScreen
            ? const SplashScreen()
            : FutureBuilder<int?>(
                future: _yearFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SplashScreen();
                  } else {
                    if (snapshot.hasData && snapshot.data != null) {
                      return const MainScreen();
                    } else {
                      return const StartScreen();
                    }
                  }
                },
              ),
      ),
    );
  }
}
