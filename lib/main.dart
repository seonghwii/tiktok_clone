import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

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
        primaryColor: const Color(0xFFE9435A,), // 틱톡 original 색상 지정
),
      home: Padding(
        padding: EdgeInsets.all(Sizes.size14,), // Sizes 사용법
        child: Row(
          children: [
            Text('hello'),
            Gaps.h20,
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
