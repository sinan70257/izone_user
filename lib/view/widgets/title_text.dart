import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text productTitle(String label) {
  return Text(
    label,
    style: GoogleFonts.sora(
        textStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
    )),
  );
}
