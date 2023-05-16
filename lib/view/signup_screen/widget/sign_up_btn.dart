import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/login_screen/widgets/text_field.dart';
import 'package:izone_user/view/splash_screen/spalsh_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

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
                signUp(context);
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 28)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.circleStrokeSpin,
            colors: [white],
            strokeWidth: 2,
          ),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );

      final currentUser = FirebaseAuth.instance.currentUser;
      await currentUser!.updateDisplayName(nameController.text.trim());
      // log(currentUser.toString());

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sign-up successful',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CheckUserLogin(),
        ),
      );

      userNameController.clear();
      passwordController.clear();
      nameController.clear();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMessage = 'Enter valid Credentials';
      if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Please enter a minimum of 6 characters password';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
