import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/features/widgets/auth_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/features/authentication/login_screen.dart';
import 'package:tictok_clone/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            const LoginScreen(), // log in 텍스트를 클릭할 때 LoginSCreen을 보여준다.
      ),
    );
  }

  // void _onEmailTap(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           const UsernameScreen(), // Sign up 텍스트를 클릭할 때 UsernameScreen을 보여준다.
  //     ),
  //   );
  // }

  void _onScaffoldTap(BuildContext context) {
    // 입력창 이외의 영역을 클릭할 시, 키보드가 사라지게 해준다.
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // sign up email에서 키보드 사라지는 건 못할까? 안됨. 얘는 State가 없기 때문이다. 이걸 사용하려면 StatefulWidget으로 바꾸어 주어야 한다.
    return GestureDetector(
      onTap: () => _onScaffoldTap(context),
      child: Scaffold(
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Gaps.v80,
              Text(
                "Sign up for TikTok",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40, // GestureDetector, onTap : _onEmailTap(context),
              AuthButton(
                  icon: FaIcon(FontAwesomeIcons
                      .user), // icon의 타입 : FaIcon -> AuthButton으로 가서 icon 선언;
                  text: "Use email & password"),
              Gaps.v12,
              AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple"),
            ]),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade50,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
