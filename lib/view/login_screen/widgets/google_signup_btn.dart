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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Kblue, width: 1),
            ),
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/google png.png', scale: 29),
              Text(
                '  Sign In with Google',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 22, color: Kblue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
