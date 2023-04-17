import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/order_summary.dart';

class customBottomBar extends StatefulWidget {
  const customBottomBar({super.key});

  @override
  State<customBottomBar> createState() => _customBottomBarState();
}

class _customBottomBarState extends State<customBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Kblue,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: sHeight! / 6,
      child: Column(
        children: [
          space20(),
          space10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "    Total :  ₹ 2,99,000",
                style: GoogleFonts.sora(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                height: sHeight! / 28,
                width: sWidth! / 2.5,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => orderDetails(),
                          ));
                    },
                    child: Text(
                      "Place order",
                      style: TextStyle(color: Colors.black),
                    )),
                margin: EdgeInsets.only(right: sWidth! / 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
