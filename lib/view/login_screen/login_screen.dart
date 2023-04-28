import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/login_screen/widgets/google_signup_btn.dart';
import 'package:izone_user/view/login_screen/widgets/login_btn.dart';
import 'package:izone_user/view/login_screen/widgets/main_card.dart';
import 'package:izone_user/view/login_screen/widgets/signup_btn.dart';
import 'package:izone_user/view/login_screen/widgets/text_field.dart';

import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const SignInText(title: 'Sign In'),
        kHeight20,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Email',
          icon: Icons.mail,
          myControler: userNameController,
          passChar: false,
        ),
        kHeight,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Password',
          icon: Icons.lock,
          myControler: passwordController,
          passChar: true,
        ),
        kHeight,
        kHeight20,
        const LoginBtn(),
        const GoogleSignUpBtn(),
        kHeight20,
        kHeight,
        SignUpTxtBtn(navigateTo: SignUpScreen()),
      ]),
    );
  }
}
