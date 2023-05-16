import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

Widget customField2({
  required String label,
  double? height,
  double? width,
  required bool num,
  TextEditingController? controller,
  required max,
  bool readOnly = true,
  validator,
  number = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Kgrey)),
          // height: height,
          width: width,
          child:
              customField(num, max, controller!, readOnly, validator, number),
        ),
      ],
    ),
  );
}

Widget customField(bool num, max, TextEditingController controller,
    bool readOnly, validator, number) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      inputFormatters: number
          ? [
              FilteringTextInputFormatter.allow(
                RegExp(r"[0-9]"),
              )
            ]
          : [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z]+|\s"),
              )
            ],
      validator: validator,
      readOnly: readOnly,
      cursorColor: black,
      controller: controller,
      minLines: 1,
      maxLines: max,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'Tap to add',
        hintStyle: GoogleFonts.ubuntu(
          height: 1.3,
          textStyle: TextStyle(color: Kgrey, fontSize: sHeight! / 47),
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
      ),
      style: GoogleFonts.ubuntu(
        height: 1.3,
        textStyle: TextStyle(color: Kgrey, fontSize: sHeight! / 47),
      ),
    ),
  );
}

Column customField1(
    {required String label,
    double? height,
    double? width,
    TextEditingController? ctrl,
    required bool num,
    required bool max,
    required bool read,
    required String content}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      space10(),
      Text(
        " $label",
        style: GoogleFonts.sora(
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      space10(),
      Container(
        decoration: BoxDecoration(
          color: Kgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: width,
        child: customField0(num, max, content, read, ctrl),
      ),
    ],
  );
}

Widget customField0(bool num, bool max, String content, bool read, ctrl) {
  return TextFormField(
    controller: TextEditingController(text: content),
    minLines: 1,
    readOnly: read,
    maxLines: max ? 50 : 1,
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
