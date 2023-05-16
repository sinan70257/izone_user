import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/user_details/widgets/floating_button.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';

class userDetails extends StatefulWidget {
  const userDetails({super.key});

  @override
  State<userDetails> createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, "User Details"),
      body: SizedBox(
        height: sHeight,
        width: sWidth,
        child: Column(
          children: [
            space20(),
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(FirebaseAuth
                      .instance.currentUser!.photoURL ??
                  "https://i0.wp.com/www.cocoanetics.com/files/t_hero.png?fit=706%2C644&ssl=1"),
            ),
            customField1(
                label: "User name",
                height: 50,
                width: sWidth! / 1.03,
                num: false,
                max: false,
                read: false,
                content: FirebaseAuth.instance.currentUser!.displayName!),
            customField1(
                label: "Password",
                height: 50,
                width: sWidth! / 1.03,
                num: false,
                max: false,
                read: false,
                content: FirebaseAuth.instance.currentUser!.phoneNumber ??
                    "5454212215"),
          ],
        ),
      ),
      bottomSheet: floatingButton(context),
    );
  }
}
