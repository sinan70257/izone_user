import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/orders_screen/order_summary.dart';

class customBottomBar extends StatelessWidget {
  const customBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    getwish();
    if (ptoatal.isEmpty || ptoatal[0] == "empty") {
      total = 0;
    } else {
      int t = 0;
      for (var i = 0; i < ptoatal.length; i++) {
        t = t + int.parse(ptoatal[i].toString());
      }
      total = t;
    }
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
                "    Total :  ₹ $total",
                style: GoogleFonts.sora(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                height: sHeight! / 28,
                width: sWidth! / 2.5,
                margin: EdgeInsets.only(right: sWidth! / 22),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (clist.isEmpty || clist[0] == "empty") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Add any product to continue! ",
                                  textAlign: TextAlign.center,
                                )));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => orderDetails(),
                            ));
                      }
                    },
                    child: const Text(
                      "Place order",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
