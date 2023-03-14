import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/onboarding/interests_screen.dart';

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
        scaffoldBackgroundColor: Colors.white, // 모든 앱 화면의 배경색 지정
        primaryColor: const Color(
          0xFFE9435A,
        ), // 틱톡 original 색상 지정
        appBarTheme: const AppBarTheme(
          // email_screen.dart 파일에서 가져옴.
          foregroundColor: Colors.black, // appBar의 글자 색상
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            // email_screen.dart 파일에서 가져옴.
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const InterestsScreen(),
    );
  }
}
