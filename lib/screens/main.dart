import 'package:d_n/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';
import 'package:d_n/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final bool _showSplashScreen = true;
  double textScaleFactor = 0.85;

  @override
  void initState() {
    super.initState();
  }

  Future<String?> getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Name = prefs.getString('year');
    return Name;
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
            ? const Scaffold(body: SplashScreen())
            : FutureBuilder(
                future: getInfo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SplashScreen();
                  } else {
                    if (snapshot.hasData) {
                      return const StartScreen();
                    } else {
                      return const MainScreen();
                    }
                  }
                },
              ),
      ),
    );
  }
}
