import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';
import 'package:izone_user/view/cart_screen/cart_screen.dart';
import 'package:izone_user/view/payment_screen/payment_screen.dart';
import 'package:izone_user/view/widgets/cart_list_Tile.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';
import 'package:izone_user/view/widgets/title_text.dart';

class orderDetails extends StatefulWidget {
  orderDetails({super.key, this.buynow = false});
  bool buynow;

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  @override
  Widget build(BuildContext context) {
    getwish();

    void onRemove(String itemid) {
      setState(() {
        clist.remove(itemid);
      });
    }

    void updateTotal() {
      setState(() {
        int t = 0;
        if (ptoatal.isEmpty || ptoatal[0] == "empty") {
          total = 0;
        } else {
          for (var i = 0; i < ptoatal.length; i++) {
            t = t + int.parse(ptoatal[i].toString());
          }
          total = t;
        }
      });
    }

    updateTotal();
    bool a = false;
    getRefresh(String refresh) {
      if (refresh == 'refresh') {
        setState(() {
          a = true;
        });
      }
    }

    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomSheet: customBottomBar(),
      appBar: customAppbar2(context, "Order summary", buyn: widget.buynow),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: customField1(
                  read: true,
                  label: "Deliver to",
                  // height: sHeight! / 5,
                  width: sWidth! / 1.03,
                  num: false,
                  max: true,
                  content: (selectedAddress[0] == 'empty' ||
                          selectedAddress == 'empty')
                      ? 'Select an address'
                      : "${selectedAddress['name']}\n${selectedAddress['houseNumber']}\n${selectedAddress['streetName']}\n${selectedAddress['city']}\n${selectedAddress['state']}\n${selectedAddress['pincode']}\n${selectedAddress['phoneNumber']}\n",
                ),
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
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addressScreen(),
                          ));
                      if (result == 'refresh') {
                        getRefresh("refresh");
                      }
                    },
                    child: Text("Change address"),
                  ),
                ),
              ),
              productTitle("  Orders"),
              ListView.builder(
                  itemCount: widget.buynow ? buynow.length : clist.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product1 = allProducts
                        .where((item) => clist.contains(item['id']))
                        .toList()
                      ..sort((a, b) => clist
                          .indexOf(a['id'])
                          .compareTo(clist.indexOf(b['id'])));
                    final buynowfilter = allProducts
                        .where((item) => buynow.contains(item['id']))
                        .toList()
                      ..sort((a, b) => buynow
                          .indexOf(a['id'])
                          .compareTo(buynow.indexOf(b['id'])));

                    final product =
                        widget.buynow ? buynowfilter[index] : product1[index];
                    // buynow = buynowfilter;
                    cartproduct = product1;

                    return cartListTile(
                      buyn: widget.buynow,
                      index: index,
                      onRemove: onRemove,
                      product: product,
                      updateTotal: updateTotal,
                    );
                  }),
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
          color: black,
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
                widget.buynow
                    ? "    Total :  ₹ $buynowtotal"
                    : "    Total :  ₹ $total",
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
                      if (selectedAddress[0] == "empty") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14))),
                            content: const SizedBox(
                              height: 50,
                              child: Center(
                                child: Text("Select an address",
                                    textAlign: TextAlign.center),
                              ),
                            )));
                      } else if (widget.buynow
                          ? buynowtotal == 0
                          : total == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14))),
                            content: const SizedBox(
                              height: 51,
                              child: Center(
                                child: Text("Add some products ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                            )));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                buynow: widget.buynow,
                              ),
                            ));
                      }
                    },
                    child: Text(
                      "Continue",
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
