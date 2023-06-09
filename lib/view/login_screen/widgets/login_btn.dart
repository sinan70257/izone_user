import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/main.dart';
import 'package:izone_user/view/login_screen/widgets/text_field.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Kblue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                signIn(context);
                nameController.clear();
                userNameController.clear();
                passwordController.clear();
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 22)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn(context) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
              indicatorType: Indicator.circleStrokeSpin,
              colors: [white],
              strokeWidth: 2),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: passwordController.text.trim());
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Logged In  successfully',
            style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );

      userNameController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Enter valid Credentials';
      if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 15),
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 232, 15, 0),
        ),
      );
    }
    navigatorKey.currentState!.popUntil((route) {
      return route.isFirst;
    });
  }
}
