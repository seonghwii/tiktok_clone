import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/onboarding/interests_screen.dart';
import 'package:tictok_clone/features/widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    // 위젯이 사라질 때 컨트롤러를 메모리에서 삭제해주기 위해 추가
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value =
        TextEditingValue(text: textDate); // 컨트롤러로 TextField의 값 설정하는 방법
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              cursorColor: Theme.of(context).primaryColor, // 커서 컬러 설정
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  // 탭하지 않았을 때 언더라인 색상 지정
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  // 탭 했을 때 언더라인 색상 지정
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ), // 문자 입력 위젯
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(disabled: false), // false로 설정하면 항상 활성화된다.
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: initialDate, // 초기 날짜 설정
            initialDateTime: initialDate
                .subtract(const Duration(days: 365 * 12)), // 최대 날짜 설정
            mode: CupertinoDatePickerMode.date, // 포맷 변경
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
