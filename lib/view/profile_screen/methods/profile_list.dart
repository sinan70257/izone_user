import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

Widget profileList(String label, Widget goto, bool page, context) {
  return InkWell(
    onTap: () {
      page
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => goto,
              ))
          : null;
    },
    child: Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(left: 20),
      width: sWidth! / 1.05,
      height: sHeight! / 14,
      decoration: BoxDecoration(
        color: Kgrey,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.sora(
                textStyle: TextStyle(
              fontSize: sWidth! / 18,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    ),
  );
}
