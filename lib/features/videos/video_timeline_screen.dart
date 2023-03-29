import 'package:flutter/material.dart';
import 'package:tictok_clone/features/videos/widgets/video_post.dart';

class VideoTimeLineScreen extends StatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  State<VideoTimeLineScreen> createState() => _VideoTimeLineScreenState();
}

class _VideoTimeLineScreenState extends State<VideoTimeLineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(page, // 모든 화면에 적용시키기 위해 if문 밖으로 빼줌.
        duration: _scrollDuration,
        curve: _scrollCurve);

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 40, // indicator 위치 조정
      edgeOffset: 10, // indicator 시작 지점
      backgroundColor: Colors.red,
      strokeWidth: 5,
      onRefresh: _onRefresh,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical, // 위아래로 스크롤 시 화면 전환
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index),
      ),
    );
  }
}


// 영상이 끝나거나 , 사용자가 영상 탭을 보지 않을 때 화면을 렌더링해주지 않는 기능(즉, VideoPost한테 사용자가 영상 탭을 보는지 아닌지 알려주어야 한다.)