import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notifications = List.generate(
      20, (index) => "${index}h"); // 20개의 '1h, 2h, ...'가 들어있는 list가 생성된다.
  // index는 아이템의 번호 (ex - 1h, 2h, ...)

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));

  late final Animation<double> _animation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  void _onDismissed(String notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  void _onTitleTap() {
    if (_animationController.isCompleted) {
      _animationController.reverse(); // 애니메이션 반대로 작동
    } else {
      _animationController.forward(); // 애니메이션 play
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _onTitleTap,
          child: Row(
            // 왜 Row를 썼는가? text랑 아이콘이랑 나란히 두기 위해서!
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("All Activity"),
              Gaps.h2,
              RotationTransition(
                turns: _animation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Sizes.size14,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: ListView(
          // 실제 데이터를 사용할 경우 ListView.builder를 사용할 것이다. (사용자에게 보여지는 데이터만 다룰 것이기 때문이다.)
          children: [
            Gaps.v14,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size12,
              ),
              child: Text(
                'New',
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Gaps.v14,
            for (var notification in _notifications)
              Dismissible(
                key: Key(notification), // 모든 아이템에 다른 값을 갖게 될 unique key
                onDismissed: (direction) => _onDismissed(notification),
                background: Container(
                  alignment: Alignment.centerLeft, // 컨테이너의 child들을 정렬해준다.
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: Sizes.size10,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.checkDouble,
                      color: Colors.white,
                      size: Sizes.size32,
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight, // 컨테이너의 child들을 정렬해준다.
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: Sizes.size10,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.trashCan,
                      color: Colors.white,
                      size: Sizes.size32,
                    ),
                  ),
                ),
                child: ListTile(
                  minVerticalPadding: Sizes.size16,
                  leading: Container(
                    width: Sizes.size52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey.shade400, width: Sizes.size1),
                    ),
                    child: const Center(
                      // center안에 아이콘을 넣어주어야 정상적으로 보인다.
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  title: RichText(
                    text: TextSpan(
                      // 맨 앞에 있는 텍스트를 먼저 기재해준다.
                      text: "Account updates:",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: Sizes.size16,
                      ),
                      children: [
                        // 그 뒤에 넣어줄 항목들은 children 안에 TextSpan으로 넣어준다.
                        const TextSpan(
                          text: " Upload longer videos",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: " $notification",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
