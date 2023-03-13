import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/password_screen.dart';
import 'package:tictok_clone/features/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  String _email = ""; // state에 데이터 저장

  @override
  void initState() {
    super.initState();
    _emailcontroller.addListener(
      () {
        // print(_emailcontroller.text); // 변화 감지를 확인하기 위한 디버깅 작업
        setState(() {
          _email = _emailcontroller.text;
        });
      },
    );
  }

  @override
  void dispose() {
    // 위젯이 사라질 때 컨트롤러를 메모리에서 삭제해주기 위해 추가
    _emailcontroller.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not Valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    // 입력창 이외의 영역을 클릭할 시, 키보드가 사라지게 해준다.
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) {
      return; // 유효하지 않거나 이메일이 비어있을 때
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    ); // 다른 페이지로 넘어가게끔 지정
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
                "What is your email?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                onEditingComplete: _onSubmit,
                keyboardType: TextInputType.emailAddress, // 키보드 타입 변경
                autocorrect: false, // 자동 완성 기능 비활성화
                controller: _emailcontroller,
                cursorColor: Theme.of(context).primaryColor, // 커서 컬러 설정
                decoration: InputDecoration(
                  errorText: _isEmailValid(),
                  hintText: "Email", // 입력창에 기본적으로 기재되어 있는 글자 입력
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
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _email.isEmpty || _isEmailValid() != null,
                  name: 'Sign up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
