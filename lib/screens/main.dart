import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d_n/screens/main_screen.dart';
import 'package:d_n/screens/splash_screen.dart';
import 'package:d_n/screens/start_screen.dart';

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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSplashScreen = false;
        });
      }
    });
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
        body: _showSplashScreen ? const SplashScreen() : const MainScreen(),
      ),
    );
  }
}
