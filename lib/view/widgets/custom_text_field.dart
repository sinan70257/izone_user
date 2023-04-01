import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

Column customField2(
    {required String label,
    required double height,
    required double width,
    required bool num,
    required bool max,
    required String content}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        " $label",
        style: GoogleFonts.sora(
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      Container(
        decoration: BoxDecoration(
          color: Kgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: width,
        child: customField(num, max, content),
      ),
    ],
  );
}

Widget customField(bool num, bool max, String content) {
  return TextFormField(
    minLines: 1,
    initialValue: content,
    readOnly: true,
    maxLines: max ? 10 : 1,
    keyboardType: num ? TextInputType.number : TextInputType.text,
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintStyle: GoogleFonts.inter(
          textStyle: const TextStyle(color: Color.fromARGB(255, 80, 80, 80))),
    ),
  );
}
