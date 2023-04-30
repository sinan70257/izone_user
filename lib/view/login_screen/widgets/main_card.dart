import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 165),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 250,
            child: Image.asset(
              "lib/assets/iZone.png",
              fit: BoxFit.cover,
            ),
          ),
          kHeight,
          Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 40,
                color: Kgrey3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight20,
        ],
      ),
    );
  }
}
