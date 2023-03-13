import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.name,
  });

  final bool disabled;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 다른 화면으로 유저 정보를 보낼 버튼 생성
      widthFactor: 1,
      child: AnimatedContainer(
        // 버튼에 대한 애니메이션 처리
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),

        child: AnimatedDefaultTextStyle(
          // 텍스트에 대한 애니메이션 처리
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
