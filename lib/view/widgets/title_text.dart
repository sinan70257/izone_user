import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productTitle(String label) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 10),
    child: Text(
      label,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
    ),
  );
}
