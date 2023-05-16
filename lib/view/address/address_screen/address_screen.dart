import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/address_screen/widgets/address_list.dart';
import 'package:izone_user/view/address/address_screen/widgets/select_address.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/address/address_screen/widgets/custom_button.dart';

int selectedIndex = 0;

class addressScreen extends StatefulWidget {
  const addressScreen({super.key});

  @override
  State<addressScreen> createState() => _addressScreenState();
}

class _addressScreenState extends State<addressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, "Address"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisSize: MainAxisSize.min,
        children: [
          space10(),
          selectAddress(),
        ],
      ),
    );
  }
}
