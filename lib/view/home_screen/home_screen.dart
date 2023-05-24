import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/home_screen/widgets/home_slider.dart';
import 'package:izone_user/view/home_screen/widgets/horizontal_slider.dart';
import 'package:izone_user/view/home_screen/widgets/product_grid.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/title_text.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    getwish();

    return Scaffold(
        appBar: customAppbar(context, true, "", true),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                space10(),
                slider(images: img),
                space10(),
                productTitle("New Arrivals"),
                horizontalSlider(),
                space10(),
                productTitle("All products"),
                productGrid(),
              ],
            ),
          ),
        ));
  }
}
