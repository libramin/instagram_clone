import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/home_page.dart';
import '../constants/auth_input_deco.dart';
import '../constants/common_size.dart';
import 'or_divider.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _pwcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _pwcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(common_gap),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 16),
                Image.asset('assets/images/insta_text_logo.png'),
                TextFormField(
                  controller: _emailcontroller,
                  validator: (text) {
                    if (text!.isNotEmpty && text.contains('@')) {
                      return null;
                    } else {
                      return '올바른 이메일을 입력 해 주세요';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: inputDeco('Email'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _pwcontroller,
                  validator: (text) {
                    if (text!.isNotEmpty && text.length > 5) {
                      return null;
                    } else {
                      return '비밀번호를 6자리 이상 입력 해 주세요';
                    }
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: inputDeco('Password'),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue
                    ),
                      onPressed: (){}, child: Text('계정을 잊으셨나요?')),
                ),
                _submitBtn(context),
                SizedBox(height: 12),
                orDivider(),
                TextButton.icon(
                    style: TextButton.styleFrom(
                        primary: Colors.blue
                    ),
                    onPressed: () {},
                    icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                    label: Text('Login with Facebook'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _submitBtn(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7))),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print('validation Success!');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => HomePage()));
          } else {}
        },
        child: Text(
          '로그인',
          style: TextStyle(color: Colors.white),
        ));
  }
}
