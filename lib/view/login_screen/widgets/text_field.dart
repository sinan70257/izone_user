import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class MyTextField extends StatefulWidget {
  String title;
  var myControler;
  IconData? icon;
  bool passChar;
  double ht;
  double border;
  MyTextField(
      {super.key,
      required this.title,
      required this.icon,
      required this.myControler,
      required this.passChar,
      required this.ht,
      required this.border});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, top: 1),
            height: widget.ht,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 26, 26, 26),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: widget.passChar,
                controller: widget.myControler,
                cursorColor: Kblue,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: white),
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(widget.icon, size: 22, color: Kblue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: widget.title,
                  hintStyle: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Kgrey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
