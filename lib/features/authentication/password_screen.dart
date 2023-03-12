import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/birthday_screen.dart';
import 'package:tictok_clone/features/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordcontroller = TextEditingController();
  String _password = ""; // state에 데이터 저장

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordcontroller.addListener(
      () {
        // print(_passwordcontroller.text); // 변화 감지를 확인하기 위한 디버깅 작업
        setState(() {
          _password = _passwordcontroller.text;
        });
      },
    );
  }

  @override
  void dispose() {
    // 위젯이 사라질 때 컨트롤러를 메모리에서 삭제해주기 위해 추가
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty &&
        _password.length > 8 &&
        _password.length <= 20;
  }

  void _onScaffoldTap() {
    // 입력창 이외의 영역을 클릭할 시, 키보드가 사라지게 해준다.
    FocusScope.of(context).unfocus();
  }

  bool _isLettersValid() {
    final regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]");
    return _password.isNotEmpty && regExp.hasMatch(_password);
  }

  void _onSubmit() {
    if (!_isPasswordValid()) {
      return; // 유효하지 않거나 이메일이 비어있을 때
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    ); // 다른 페이지로 넘어가게끔 지정
  }

  void _onClearTap() {
    _passwordcontroller.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                autocorrect: false, // 자동 완성 기능 비활성화
                controller: _passwordcontroller,
                cursorColor: Theme.of(context).primaryColor, // 커서 컬러 설정
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),

                  hintText: "Make it strong", // 입력창에 기본적으로 기재되어 있는 글자 입력
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
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    // color: Colors.green.shade500,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                    size: Sizes.size20,
                  ),
                  Gaps.h4,
                  const Text(
                    "8 to 20 characters",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              Gaps.v2,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color:
                        _isLettersValid() ? Colors.green : Colors.grey.shade400,
                    size: Sizes.size20,
                  ),
                  Gaps.h4,
                  const Text(
                    "Letters, number, and special characters",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: !_isPasswordValid() && !_isLettersValid()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
