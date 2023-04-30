import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

double? sHeight;
double? sWidth;

const kHeight = SizedBox(height: 10);
const kHeight20 = SizedBox(height: 20);
const kWidth = SizedBox(width: 100);
// ignore: non_constant_identifier_names
Color Kgrey = const Color.fromRGBO(217, 217, 217, 1);
Color Kgrey2 = const Color.fromARGB(255, 59, 59, 59);
Color Kgrey3 = Color.fromARGB(255, 78, 78, 78);
Color white = Colors.white;
Color black = Colors.black;

Color Kblue = Color.fromARGB(255, 0, 129, 234);
Widget space10() {
  return SizedBox(
    height: sHeight! / 120,
    width: sHeight! / 120,
  );
}

Widget space20() {
  return SizedBox(
    height: sHeight! / 60,
    width: sHeight! / 60,
  );
}

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}

bool selected = false;
List wlist = [];
List clist = [];
