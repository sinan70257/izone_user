import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

class wishList extends StatefulWidget {
  const wishList({super.key});

  @override
  State<wishList> createState() => _wishListState();
}

class _wishListState extends State<wishList> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, false, "Wish List", true),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) => wishListTile(),
              ),
              SizedBox(
                  // height: sHeight! / 50,
                  )
            ],
          ),
        ),
      ),
    );
  }

  Container wishListTile() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 6, right: 6),
      height: sHeight! / 9,
      width: sWidth! / 1.05,
      decoration: BoxDecoration(
        color: Kgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          space10(),
          Container(
            width: sWidth! / 5,
            height: sWidth! / 5,
            decoration: BoxDecoration(
                color: Kblue,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ovantica.com/pub/media/catalog/product/cache/359e51c8e354c4e2b5af98e814f93978/i/p/iphone-11-128gb-green_1.jpg"),
                    fit: BoxFit.cover)),
          ),
          space20(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "iPhone 11",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: sWidth! / 22)),
              ),
              Text("128 GB"),
              space10(),
              Text(
                "₹ 69,000",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: sWidth! / 21),
                ),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.favorite_outlined,
            size: sHeight! / 30,
          ),
          space20(),
        ],
      ),
    );
  }
}
