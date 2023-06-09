import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/login_screen/login_screen.dart';
import 'package:izone_user/view/login_screen/widgets/main_card.dart';
import 'package:izone_user/view/login_screen/widgets/signup_btn.dart';
import 'package:izone_user/view/login_screen/widgets/text_field.dart';
import 'package:izone_user/view/signup_screen/widget/sign_up_btn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const SignInText(title: 'Sign Up'),
        kHeight20,
        kHeight,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Name',
          icon: Icons.abc,
          myControler: nameController,
          passChar: false,
        ),
        kHeight,
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
        SignUpBtn(),
        kHeight20,
        SignUpTxtBtn(
          signUp: false,
          navigateTo: LoginScreen(),
        )
      ]),
    );
  }
}
