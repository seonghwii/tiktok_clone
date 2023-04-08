import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  // bool _isTouched = false;
  // final TextEditingController _textEditingController = TextEditingController();

  String text = "";

  void _stop() {
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  // void _isWriting() {
  //   setState(() {
  //     _isTouched = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _stop,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: Sizes.size8,
            leading: const Stack(
              children: [
                CircleAvatar(
                  // 코드챌린지
                  radius: Sizes.size24,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/adorable-kitty-looking-like-it-want-to-hunt_23-2149167099.jpg?w=2000"),
                ),
                Positioned(
                  left: 29,
                  top: Sizes.size32,
                  child: CircleAvatar(
                    radius: Sizes.size10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: Sizes.size7,
                      backgroundColor: Colors.green,
                    ),
                  ),
                )
              ],
            ),
            title: const Text(
              "xxxxmmm967",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Active now",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: Sizes.size12,
              ),
            ),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                                isMine ? Sizes.size20 : Sizes.size5),
                            bottomRight: Radius.circular(
                                !isMine ? Sizes.size20 : Sizes.size5),
                          ),
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                        ),
                        child: const Text(
                          "this is a message",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 10),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                  height: Sizes.size56,
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                            Sizes.size6,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                                horizontal: Sizes.size32,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(
                                  top: Sizes.size12,
                                ),
                                child: FaIcon(FontAwesomeIcons.faceSmile),
                              ),
                              enabledBorder: OutlineInputBorder(
                                // 내부 입력창 생성
                                borderSide: BorderSide(
                                    color: Colors.transparent), // border 색상 변경
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Sizes.size20),
                                  topRight: Radius.circular(Sizes.size20),
                                  bottomLeft: Radius.circular(Sizes.size20),
                                ),
                              ),
                              fillColor: Colors.white,
                              hintText: ("Send a message..."),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          child: const FaIcon(FontAwesomeIcons.paperPlane),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
