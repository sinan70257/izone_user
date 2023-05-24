import 'package:flutter/material.dart';
import 'package:izone_user/view/order_details/widgets/tracking_bar.dart';
// import 'package:order_tracker/order_tracker.dart';

class StatusPage extends StatelessWidget {
  StatusPage({Key? key, this.data}) : super(key: key);
  final data;

  ///this TextDto present in a package add data in this dto and set in a list.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: OrderTracker(
        status: status(),
        activeColor: Colors.green,
        inActiveColor: Colors.grey[300],
        // orderTitleAndDateList: orderList,
        // shippedTitleAndDateList: shippedList,
        // outOfDeliveryTitleAndDateList: outOfDeliveryList,
        // deliveredTitleAndDateList: deliveredList,
      ),
    );
  }

  status() {
    switch (data['status']) {
      case 'Ordered':
        return Status.order;

      case 'Shipped':
        return Status.shipped;

      case 'Out Of Delivery':
        return Status.outOfDelivery;

      case 'Delivered':
        return Status.delivered;

      // default:
    }
  }
}
