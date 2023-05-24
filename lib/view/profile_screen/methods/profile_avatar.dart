import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

SizedBox UserProfile() {
  return SizedBox(
    height: sHeight! / 6,
    width: sWidth!,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // alignment: Alignment.,
            height: 150,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello,",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: sWidth! / 11, fontWeight: FontWeight.bold),
                    )),
                Text(
                    "${FirebaseAuth.instance.currentUser!.displayName ?? "User"} !",
                    style: GoogleFonts.sora(
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: sHeight! / 7,
            width: sHeight! / 7,
            decoration: BoxDecoration(
                color: Kgrey, borderRadius: BorderRadius.circular(90)),
            child: Center(
              child: SizedBox(
                height: sHeight! / 7.5,
                width: sHeight! / 7.5,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(FirebaseAuth
                          .instance.currentUser!.photoURL ??
                      "https://www.academicsforcompanies.be/static_cdn/main/contact/team_members/default_thumbnail.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
