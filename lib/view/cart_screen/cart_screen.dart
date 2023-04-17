import 'package:flutter/material.dart';
import 'package:izone_user/view/cart_screen/methods/custom_button.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/cart_list_Tile.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomSheet: customBottomBar(),
        appBar: customAppbar(context, false, "My cart", true),
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => cartListTile(),
                  ),
                  SizedBox(
                    height: sHeight! / 14,
                  )
                ],
              ),
            )));
  }
}
