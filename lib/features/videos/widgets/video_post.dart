import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/videos/widgets/video_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");
  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  bool _isPaused = false;
  bool _isSeeMoreClicked = false;
  int _maxLines = 1;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration == // 영상 길이
          _videoPlayerController.value.position) {
        // 사용자 영상 내의 위치
        widget.onVideoFinished(); // 영상 끝.
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize(); // 초기화
    await _videoPlayerController.setLooping(true);

    _videoPlayerController
        .addListener(_onVideoChange); // 이 부분을 삭제/주석처리 해주면 영상이 무한재생되지 않는다.
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5, // 기본값
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onSeeMoreTap() {
    if (_isSeeMoreClicked == true) {
      _maxLines = 3;
    } else {
      _maxLines = 1;
    }
    setState(() {
      _isSeeMoreClicked = !_isSeeMoreClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ), // 화면 전체를 채우는 위젯
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    // animationController의 값이 변경되는 것을 감지
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child, // 아래 AnimatedOpacity 값을 넘겨주기 위함이다.
                    );
                  },
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _isPaused ? 1 : 0,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size56,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20, // 위치 조정
            left: 10, // 위치 조정
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@seonghwii",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        "This is my desktop!!! This is my desktop!!! This is my desktop!!! This is my desktop!!! This is my desktop!!!",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: _maxLines,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onSeeMoreTap,
                      child: const Text(
                        "See More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black, // 아이콘 색상
                  foregroundColor: Colors.white, // 글씨 색상
                  foregroundImage: NetworkImage(
                      "https://user-images.githubusercontent.com/92002390/226542996-9dddf594-1cba-4ea8-b107-3a90aa3bb1e9.jpg"),
                  child: Text("승휘"),
                ),
                Gaps.v24,
                VideoButton(icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                Gaps.v24,
                VideoButton(icon: FontAwesomeIcons.solidComment, text: "33K"),
                Gaps.v24,
                VideoButton(icon: FontAwesomeIcons.share, text: "Share"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}