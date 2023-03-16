import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

/*Text(
     "Watch cool videos!",
    style: TextStyle(
      fontSize: Sizes.size40,
      fontWeight: FontWeight.bold,
    ),
  ),
  Gaps.v16,
  Text(
    "Videos are personalized for you based on what you watch, like, and share.",
    style: TextStyle(
      fontSize: Sizes.size20,
      color: Colors.grey.shade700,
    ),
  ), */

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // to the left
      _direction = Direction.left;
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate, // 화면의 동작 감지(드래그의 방향을 알아낼 수 있다.)
      onPanEnd: _onPanEnd, // 동작이 멈췄을 때 시행할 동작 지정(화면 전환)
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const TutorialPage(
                title: "Watch cool videos!",
                contents:
                    "Videos are personalized for you based on what you watch, like, and share.",
              ),
              secondChild: const TutorialPage(
                title: "Follow the rules",
                contents: "Take care of one another! Plis!",
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size24, horizontal: Sizes.size24),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _showingPage == Page.first ? 0 : 1, // 첫번째 페이지에서는 버튼 숨김
              child: CupertinoButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                child: const Text('Enter the app!'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TutorialPage extends StatelessWidget {
  const TutorialPage({
    super.key,
    required this.title,
    required this.contents,
  });

  final String title;
  final String contents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v80,
        Text(
          title,
          style: const TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          contents,
          style: TextStyle(
            fontSize: Sizes.size20,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
