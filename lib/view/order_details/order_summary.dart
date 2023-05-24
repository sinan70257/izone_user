import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/order_details/widgets/ordered_products.dart';
import 'package:izone_user/view/order_details/widgets/tracker.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';

class DeliveryStatusPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  // ignore: prefer_typing_uninitialized_variables
  final product;

  const DeliveryStatusPage({super.key, this.data, this.product});

  @override
  State<DeliveryStatusPage> createState() => _DeliveryStatusPageState();
}

class _DeliveryStatusPageState extends State<DeliveryStatusPage> {
  bool flag = true;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar2(context, "Order details"),
        body: ListView(
          children: [
            flag
                ? Text(
                    "  Order status",
                    style: GoogleFonts.sora(
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  )
                : SizedBox(),
            flag
                ? StatusPage(data: widget.data)
                : Center(
                    child: customField1(
                      label: "Order status",
                      height: 50,
                      width: sWidth! / 1.03,
                      num: false,
                      max: false,
                      read: true,
                      content: "Order Cancelled",
                    ),
                  ),
            Center(
              child: customField1(
                  label: "Address",
                  width: sWidth! / 1.03,
                  num: false,
                  max: true,
                  read: true,
                  content:
                      "${widget.data["address"]['name']}\n${widget.data["address"]['houseNumber']}\n${widget.data["address"]['streetName']}\n${widget.data["address"]['city']}\n${widget.data["address"]['state']}\n${widget.data["address"]['pincode'].toString()}\n${widget.data["address"]['phoneNumber'].toString()}"),
            ),
            space10(),
            Text(
              "  Item",
              style: GoogleFonts.sora(
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            orderedProducts(product: widget.product, data: widget.data),
            space10(),
            Center(
              child: customField1(
                label: "Payment method",
                height: 50,
                width: sWidth! / 1.03,
                num: false,
                max: false,
                read: true,
                content: widget.data["payment"],
              ),
            ),
            space10(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                )),
                onPressed: () {
                  // updateStatus(widget.data, widget.product, 'Cancelled');

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your order has been cancelled")));
                  setState(() {
                    flag = false;
                  });
                  // Navigator.pop(context, 'refresh');
                  // Navigator.pop(context, 'refresh');
                  // refresh();
                },
                child: Text("Cancel order"),
              ),
            )
          ],
        ));
  }
}
