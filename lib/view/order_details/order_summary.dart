import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/order_details/widgets/ordered_products.dart';
import 'package:izone_user/view/order_details/widgets/tracker.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';
import 'package:izone_user/view/widgets/title_text.dart';
import 'package:step_indicator/step_indicator.dart';

class DeliveryStatusPage extends StatefulWidget {
  @override
  _DeliveryStatusPageState createState() => _DeliveryStatusPageState();
}

class _DeliveryStatusPageState extends State<DeliveryStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar2(context, "Delivery Status"),
        body: ListView(
          children: [
            const StatusPage(),
            Center(
              child: customField1(
                  label: "Address",
                  height: 100,
                  width: sWidth! / 1.03,
                  num: false,
                  max: true,
                  read: true,
                  content:
                      "Inshad K \nThannikode house, Mathur post, Palakkad\nPin:456212"),
            ),
            space10(),
            productTitle(" Products"),
            space10(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => orderedProducts(),
              itemCount: 2,
            ),
            space10(),
            Center(
              child: customField1(
                label: "Payment method",
                height: 50,
                width: sWidth! / 1.03,
                num: false,
                max: false,
                read: true,
                content: "UPI",
              ),
            ),
            space20(),
          ],
        ));
  }
}
