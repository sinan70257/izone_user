import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/orders_screen.dart';
import 'package:izone_user/view/user_details/user_details.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, false, "Account", true),
      body: Column(
        children: [
          UserProfile(),
          profileList("Your orders", ordersScreen(), true),
          profileList("Account", userDetails(), true),
          profileList("Privacy & policy", ordersScreen(), false),
          profileList("Terms & Conditions", ordersScreen(), false),
          profileList("Log out", ordersScreen(), false),
        ],
      ),
    );
  }

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
            Text("Hello, User !",
                style: GoogleFonts.sora(
                  textStyle: TextStyle(
                      fontSize: sWidth! / 11, fontWeight: FontWeight.bold),
                )),
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
                    backgroundImage: NetworkImage(
                        "https://cdn.profoto.com/cdn/053149e/contentassets/d39349344d004f9b8963df1551f24bf4/profoto-albert-watson-steve-jobs-pinned-image-original.jpg?width=1280&quality=75&format=jpg"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileList(String label, Widget goto, bool page) {
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

  void fun() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ordersScreen(),
        ));
  }
}
