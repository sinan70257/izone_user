import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/popup.dart';

class profile_tile extends StatelessWidget {
  const profile_tile({
    super.key,
    this.title,
    this.file,
  });
  final title;
  final file;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              title,
              style: GoogleFonts.sora(
                  textStyle: TextStyle(
                fontSize: sWidth! / 18,
                fontWeight: FontWeight.w600,
              )),
            ),
          ],
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (builder) {
              return settingmenupopup(
                mdFilename: file,
              );
            });
      },
    );
  }
}
