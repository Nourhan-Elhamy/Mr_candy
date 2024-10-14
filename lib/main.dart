import 'package:flutter/material.dart';
import 'package:mr_candy/core/utils/app_fonts.dart';


import 'features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(fontFamily: AppFonts.almarai),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

