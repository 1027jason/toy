import 'package:application/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase 패키지를 import 합니다.

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 바인딩을 확실히 초기화합니다.
  await Firebase.initializeApp(); // Firebase를 초기화합니다.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
