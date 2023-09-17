import 'package:application/LoginScreen/loginscreen.dart';
import 'package:application/SingUpScreen/signupscreen.dart';
import 'package:flutter/material.dart';

import '../Functions/functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: const Text("회원가입"),
            ),
            const SizedBox(height: 20), // 간격을 위한 SizedBox
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen()), // 로그인 화면으로 이동
                );
              },
              child: const Text("로그인"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await signInWithGoogle();
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Google 로그인 실패')),
                  );
                }
              },
              child: const Text("Google로 로그인"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // 비밀번호 재설정 로직 구현
              },
              child: const Text("비밀번호 재설정"),
            ),
          ],
        ),
      ),
    );
  }
}
