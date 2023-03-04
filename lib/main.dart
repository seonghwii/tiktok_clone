import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        primaryColor: const Color(
          0xFFE9435A,
        ), // 틱톡 original 색상 지정
      ),
      home: const SignUpScreen(),
    );
  }
}
