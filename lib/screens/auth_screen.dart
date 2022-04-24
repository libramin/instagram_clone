import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/fade_stack.dart';
import 'package:instagram_clone/widget/signin_form.dart';
import 'package:instagram_clone/widget/signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
      children: [
        FadeStack(selectedForm: selectedForm),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 45,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black
                  )
                )
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                  onPressed: () {
                    setState(() {
                      if (selectedForm == 0) {
                        selectedForm = 1;
                      } else {
                        selectedForm = 0;
                      }
                    });
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: (selectedForm == 0)
                              ? '이미 계정이 있으신가요? '
                              : '계정이 없으신가요? ',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: (selectedForm == 0) ? '로그인' : '회원가입',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold))
                    ]),
                  )),
            )),
      ],
    )));
  }
}
