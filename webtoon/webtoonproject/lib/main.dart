import 'package:flutter/material.dart';
import 'package:webtoonproject/hscreen/homescreen.dart';
import 'package:webtoonproject/services/ApiServices.dart';

void main() {
  ApiServices.getTodaysToon();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
