import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // https://medium.flutterdevs.com/customscrollview-slivers-in-flutter-72169ed264b7
            // floating: true, // 추가
            // stretch: true, // 추가
            backgroundColor: Colors.teal,
            collapsedHeight: 100,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              // stretchModes: const [
              //   StretchMode.blurBackground,
              //   StretchMode.fadeTitle,
              //   StretchMode.zoomBackground,
              // ],
              background: Image.asset(
                "assets/images/dog.jpg",
                fit: BoxFit.cover,
              ),
              title: const Text("hello!"),
            ),
          ),
        ],
      ),
    );
  }
}
