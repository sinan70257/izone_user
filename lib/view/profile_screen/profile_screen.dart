import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/constants/provider.dart';
import 'package:izone_user/view/profile_screen/methods/profile_avatar.dart';
import 'package:izone_user/view/profile_screen/methods/profile_list.dart';
import 'package:izone_user/view/profile_screen/widgets/logout_button.dart';
import 'package:izone_user/view/profile_screen/widgets/profile_tile.dart';
import 'package:izone_user/view/widgets/popup.dart';
import 'package:izone_user/view/orders_screen/orders_screen.dart';
import 'package:izone_user/view/splash_screen/spalsh_screen.dart';
import 'package:izone_user/view/user_details/user_details.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, false, "Account", true),
      body: Column(
        children: [
          UserProfile(),
          profileList("Your orders", ordersScreen(), true, context),
          profileList("Account", userDetails(), true, context),
          profile_tile(file: "privacy_policy.md", title: "Privay Policy"),
          profile_tile(
              file: "terms_and_condition.md", title: "Terms & Conditions"),
          logoutButton(),
        ],
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
