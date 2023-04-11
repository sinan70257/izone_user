import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
              backgroundColor: Kblue,
            ),
            customField2(
                label: "User name",
                height: 50,
                width: sWidth! / 1.03,
                num: false,
                max: false,
                read: false,
                content: ""),
            customField2(
                label: "Password",
                height: 50,
                width: sWidth! / 1.03,
                num: false,
                max: false,
                read: false,
                content: ""),
          ],
        ),
      ),
      bottomSheet: floatingButton(context),
    );
  }
}
