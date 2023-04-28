import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/constants/provider.dart';
import 'package:provider/provider.dart';

class GoogleSignUpBtn extends StatelessWidget {
  const GoogleSignUpBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Kblue, width: 1),
            ),
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                  'https://img.icons8.com/fluency/512/google-logo.png',
                  scale: 13.5),
              Text(
                'Sign In with Google',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 26, color: Kblue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
