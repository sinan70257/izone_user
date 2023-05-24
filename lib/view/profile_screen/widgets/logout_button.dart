import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/constants/provider.dart';
import 'package:provider/provider.dart';

class logoutButton extends StatelessWidget {
  const logoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
                color: Kgrey2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            width: sWidth,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Are you sure ?",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: white,
                    ))),
                space50(),
                space20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 130,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Kgrey2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(width: 2, color: Kgrey))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Kgrey),
                            ))),
                    SizedBox(
                        width: 130,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Kblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(width: 2, color: Kblue))),
                            onPressed: () {
                              if (flag == 1) {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogout();

                                Navigator.pop(context);
                              } else {
                                FirebaseAuth.instance.signOut();

                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "Log out",
                              style: TextStyle(color: white),
                            )))
                  ],
                )
              ],
            ),
          ),
        );
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
              "Log Out",
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
}
