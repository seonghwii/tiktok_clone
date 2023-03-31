import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  static String inputWord = "";

  bool _isWriting = false;

  void _onSearchChanged(String value) {}

  void _onSearchSubmitted(String value) {
    _textEditingController.text = value;
    setState(() {});
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        inputWord = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTapXmark() {
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: Sizes.size8),
                  child: TextField(
                    onChanged: _onSearchChanged,
                    onSubmitted: _onSearchSubmitted,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size8,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizes.size12, vertical: Sizes.size16),
                        child: FaIcon(
                          FontAwesomeIcons.searchengin,
                          size: Sizes.size20,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size12, vertical: Sizes.size16),
                        child: GestureDetector(
                          onTap: _onTapXmark,
                          child: const FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            size: Sizes.size20,
                          ),
                        ),
                      ),
                      hintText: 'initial text',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            onTap: (value) => _stopWriting(), // 다른 탭 클릭 시 키보드 내려감
            splashFactory: NoSplash.splashFactory, // 기본 적용된 애니메이션 효과 삭제
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16, // 탭 간 padding 지정
            ),
            isScrollable: true, // 스크롤 허용
            unselectedLabelColor: Colors.grey.shade500, // 클릭 안했을 때의 글자 색상
            labelColor: Colors.black, // 선택 시 글자 색상
            indicatorColor: Colors.black, // 탭 아래의 선 색상
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600, // 텍스트 볼드체 지정
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: TabBarView(
            children: [
              GridView.builder(
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 몇 개의 컬럼을 가질 것인지 지정해주는 속성
                  crossAxisSpacing: Sizes.size10, // 좌우 컬럼 간의 거리
                  mainAxisSpacing: Sizes.size20, // 위.아래 컬럼 간의 거리
                  childAspectRatio: 9 / 10, // 자식 클래스의 비율 지정 (지정하지 않으면 정사각형)
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FadeInImage.assetNetwork(
                          fit:
                              BoxFit.cover, // 이미지가 어떤 방식으로 부모 요소에 적용될 지 정해주는 속성
                          placeholder: "assets/images/dog.jpg",
                          image:
                              "https://images.unsplash.com/photo-1679766826593-738e9b6338c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that im upload just now currently.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                "https://post-phinf.pstatic.net/MjAyMDA0MDZfMTQ5/MDAxNTg2MTY1MDE4NDI3.AgkP4-cZP_JwQzoUyRJvN7hMOiFL7iNJ9YYSWipMl5og.oI0HR3GK0a4hBioegjG02Z03rLauBqtY5EKheK_9KGEg.JPEG/%EA%B2%80%EC%9D%80%EA%B3%A0%EC%96%91%EC%9D%B4.jpg?type=w1200"),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "My avatar is going to be very long",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text(
                            "2.5M",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
