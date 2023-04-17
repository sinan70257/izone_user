import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/home_screen/widgets/home_slider.dart';
import 'package:izone_user/view/home_screen/widgets/horizontal_slider.dart';
import 'package:izone_user/view/home_screen/widgets/product_grid.dart';
import 'package:izone_user/view/splash_screen.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/title_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _honeScreenState();
}

class _honeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, true, "", true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            space10(),
            slider(),
            space10(),
            productTitle(" New Arrivals"),
            horizontalSlider(),
            space10(),
            productTitle(" All products"),
            productGrid(),
          ],
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    setState(
      () {
        isloggedIn1 = false;
      },
    );
  }
}
