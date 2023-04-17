import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';

class floatingButton extends StatefulWidget {
  const floatingButton({super.key});

  @override
  State<floatingButton> createState() => _flatingButtonState();
}

class _flatingButtonState extends State<floatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: sHeight! / 20,
      width: sWidth! / 1.1,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: customElevatedBotton(
            label: "Save",
          )),
    );
  }

  Widget customElevatedBotton({required String label}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" $label")],
        ));
  }
}
