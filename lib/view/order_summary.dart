import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address_screen.dart';
import 'package:izone_user/view/widgets/cart_list_Tile.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';
import 'package:izone_user/view/widgets/title_text.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({super.key});

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomSheet: customBottomBar(),
      appBar: customAppbar2(context, "Order summary"),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: customField2(
                    read: true,
                    label: "Deliver to",
                    height: sHeight! / 5,
                    width: sWidth! / 1.03,
                    num: false,
                    max: true,
                    content:
                        "Inshad\n Thannikode House Mathur post\n pin:64524754\n Palakkad, Kerala\n 9144845154"),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: sHeight! / 25,
                  width: sWidth! / 1.03,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Kblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addressScreen(),
                          ));
                    },
                    child: Text("Change address"),
                  ),
                ),
              ),
              productTitle("  Orders"),
              const cartListTile(),
              const cartListTile(),
              SizedBox(
                height: sHeight! / 11,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container customBottomBar() {
    return Container(
      decoration: BoxDecoration(
          color: Kblue,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: sHeight! / 11,
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
                    textStyle: const TextStyle(
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
                    onPressed: () {},
                    child: Text(
                      "Continue",
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
