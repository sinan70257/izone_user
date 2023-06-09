import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/search_screen/search_screen.dart';

AppBar customAppbar(BuildContext context, bool home, String title, bool black) {
  return AppBar(
    automaticallyImplyLeading: false,
    // centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(top: sHeight! / 20, right: sWidth! / 12),
        child: home
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => searchScreen(),
                      ));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: sWidth! / 12,
                ),
              )
            : SizedBox(),
      ),
    ],

    title: home
        ? Padding(
            padding: EdgeInsets.only(top: sHeight! / 20),
            child: SizedBox(
                height: sWidth! / 7,
                child: Image.asset('lib/assets/iZone.png', fit: BoxFit.cover)),
          )
        : Padding(
            padding: EdgeInsets.only(top: sHeight! / 20),
            child: Text(
              " $title",
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
              )),
            ),
          ),

    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: sHeight! / 8, // default is 56
    toolbarOpacity: 1,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
              colors: black ? [Colors.black, Colors.black] : [Kblue, Kblue],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
    ),
  );
}

AppBar customAppbar2(BuildContext context, String label, {bool buyn = false}) {
  return AppBar(
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.only(top: sWidth! / 10, left: sWidth! / 15),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 30,
        ),
        onPressed: () {
          if (buyn) {
            buynow.clear();
            buynowoCount = 1;
            buynowtotal = 0;
          }
          Navigator.pop(context, "refresh");
        },
      ),
    ),

    title: Padding(
      padding: EdgeInsets.only(top: sHeight! / 13),
      child: SizedBox(
        height: sWidth! / 7,
        child: Text(
          label,
          style: GoogleFonts.sora(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: sHeight! / 8, // default is 56
    toolbarOpacity: 1,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Kblue, Kblue],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
    ),
  );
}
