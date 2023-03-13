import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/features/authentication/login_form_screen.dart';
import 'package:tictok_clone/features/widgets/auth_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(children: [
            Gaps.v80,
            const Text(
              "Log for TikTok",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            const Text(
              "Manage your account, check notifications, comment on videos, and more.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v40,
            GestureDetector(
              onTap: () => _onEmailLoginTap(context),
              child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons
                      .user), // icon의 타입 : FaIcon -> AuthButton으로 가서 icon 선언;
                  text: "Use email & password"),
            ),
            Gaps.v12,
            const AuthButton(
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
                "Don't have an account?",
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Text(
                  "Sign up",
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
    );
  }
}
