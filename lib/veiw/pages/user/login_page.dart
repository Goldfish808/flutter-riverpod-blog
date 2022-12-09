import 'package:blog/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../util/vaildator_util.dart';
import '../../components/custom_elevated_buttom.dart';
import '../../components/custom_text_form_field.dart';

class LoginPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uc = ref.read(userController);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(uc),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(UserController uc) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                uc.login(username: _username.text.trim(), password: _password.text.trim());
              }
            },
          ),
          TextButton(
            onPressed: () {
              uc.joinForm();
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
