import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });

  // void _onEmailTap(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           const UsernameScreen(), // log in 텍스트를 클릭할 때 UsernameScreen을 보여준다.
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 오버랩되는 기능
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(
          Sizes.size14,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center, // 텍스트 중앙 정렬
          children: [
            Align(
                alignment: Alignment.centerLeft, // 아이콘 중앙 정렬
                child: icon),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
