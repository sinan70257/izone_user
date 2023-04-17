import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/add_address/add_address.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({super.key});

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  String? selectedAddress;
  List address = [
    "UPI",
    "Credit/Debit?ATM Card",
    "Net Banking",
    "Cash on delivery",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: customBottomBar(),
      appBar: customAppbar2(context, "Payments"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisSize: MainAxisSize.min,
        children: [
          space10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              space20(),
              Text(
                "Payment options",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              space10()
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: address.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                  color: Kgrey, borderRadius: BorderRadius.circular(10)),
              child: RadioListTile(
                activeColor: Kgrey2,
                title: Text(
                  address[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: address[index],
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget floatingButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: sHeight! / 20,
      width: sWidth! / 1.1,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: customElevatedBotton(
            label: "Save",
          )),
    );
  }

  Widget customElevatedBotton({required String label}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" $label")],
        ));
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => paymentScreen(),
                          ));
                    },
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
