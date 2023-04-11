import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';

Widget floatingButton(BuildContext ctx) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 19),
    height: sHeight! / 20,
    width: sWidth! / 1.1,
    child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: customElevatedBotton(label: "Save", ctx: ctx)),
  );
}

Widget customElevatedBotton(
    {required String label, required BuildContext ctx}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: () {
        Navigator.pop(ctx);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(" $label")],
      ));
}
