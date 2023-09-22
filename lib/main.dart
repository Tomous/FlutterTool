import 'package:firstapp/home_page.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '开源中国',
      theme: ThemeData(
        primaryColor: const Color(AppColors.APP_THEME_COLOR),
      ),
      home: const HomePage(),
    );
  }
}
