import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/model/ordered_list_model.dart';
import 'package:izone_user/view/bottom%20_navbar.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.buynow = false});
  final bool buynow;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    List buyCount = [buynowoCount];
    List buyItem = buynow;
    orderedItems = widget.buynow ? buyItem : wlist;
    orderedCount = widget.buynow ? buyCount : countlist;
    orderedAddress = selectedAddress;

    for (int i = 0; i < orderedItems.length; i++) {
      Ordered obj = Ordered(
        username: FirebaseAuth.instance.currentUser!.email!,
        address: selectedAddress,
        products: orderedItems[i],
        count: orderedCount[i],
        status: 'Ordered',
        payment: selectedMode.toString(),
      );
      obj.addToOrderedList();
    }
    updateQnty(widget.buynow);

    showOrderConfirmationDialog(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showOrderConfirmationDialog(context, success: false);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("External wallet"),
      backgroundColor: Kblue,
    ));
  }

  void makePayment() async {
    var amount = widget.buynow ? buynowtotal : total ?? 0;
    var options = {
      'key': 'rzp_test_ogEGllKQGKyKBK',
      'amount': amount * 100,
      'name': 'iZone.',
      'description': 'Ordered items',
      'prefill': {'contact': '7025778953', 'email': 'admin@gmail.com'}
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      print("error :::::${e}");
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay?.clear();
    super.dispose();
  }

  String? selectedMode;
  List modes = ["Pre-paid Online", "Cash On Delivery"];
  List images = ['lib/assets/online.png', 'lib/assets/cod.png'];
  @override
  Widget build(BuildContext context) {
    log(selectedMode.toString());
    return Scaffold(
        appBar: customAppbar2(context, "Payment"),
        body: ListView(
          children: [
            kHeight,
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 8),
              child: Text(
                'Payments options:',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              itemCount: modes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
                height: 270,
                decoration: BoxDecoration(
                  color: Kgrey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: RadioListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  activeColor: Kblue,
                  title: SizedBox(
                    child: Image.asset(
                      images[index], fit: BoxFit.contain,
                      // style: GoogleFonts.roboto(
                      //   textStyle: const TextStyle(
                      //       fontSize: 19, fontWeight: FontWeight.w500),
                      // ),
                    ),
                  ),
                  value: modes[index],
                  groupValue: selectedMode,
                  onChanged: (value) {
                    setState(() {
                      selectedMode = value;
                      log(selectedMode.toString());
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        bottomSheet: customBottomBar());
  }

  void success({fail = false, response}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          actions: [
            StreamBuilder(
                stream: getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: LoadingIndicator(
                          indicatorType: Indicator.circleStrokeSpin,
                          colors: [Kblue],
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      iphone = data
                          .where((item) => 'iPhone' == item['category'])
                          .toList();
                      ipad = data
                          .where((item) => 'iPad' == item['category'])
                          .toList();
                      watch = data
                          .where((item) => 'iWatch' == item['category'])
                          .toList();
                      macbook = data
                          .where((item) => 'MacBook' == item['category'])
                          .toList();
                      // buyNow = allProducts
                      //     .where((item) => buyNowItem == item['id'])
                      //     .toList();
                      log("product updated ");

                      allcat = allProducts = data;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(22),
                              ),
                              color: white,
                              image: DecorationImage(
                                image: AssetImage(fail
                                    ? 'assets/close (1).jpg'
                                    : 'assets/tick.png'),
                              ),
                            ),
                          ),
                          Text(
                            fail ? 'Order cancelled' : 'Order confirmed',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 22),
                            ),
                          ),
                          kHeight20,
                          Text(
                            fail
                                ? '${response.message}'
                                : 'Payment Id: ${response.paymentId}',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                          kHeight20,
                          SizedBox(
                            height: 45,
                            width: 250,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Kblue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                fail
                                    ? Navigator.pop(context)
                                    : Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavbar(cart: false),
                                        ),
                                        (route) => false);
                              },
                              icon: Icon(
                                fail
                                    ? Icons.restart_alt_rounded
                                    : Icons.shopping_bag_outlined,
                              ),
                              label: Text(
                                fail ? 'Retry' : 'Continue shopping',
                                style: GoogleFonts.roboto(fontSize: 20),
                              ),
                            ),
                          ),
                          kHeight20,
                        ],
                      );
                    }
                  }
                  return Text('Cant fetch data');
                }),
          ]),
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
                      if (selectedMode.toString() == "null") {
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
                                child: Text("Select an option",
                                    textAlign: TextAlign.center),
                              ),
                            )));
                      } else if (selectedMode.toString() ==
                          "Cash On Delivery") {
                        List buyCount = [buynowoCount];
                        List buyItem = buynow;
                        orderedItems = widget.buynow ? buyItem : wlist;
                        orderedCount = widget.buynow ? buyCount : countlist;
                        orderedAddress = selectedAddress;

                        for (int i = 0; i < orderedItems.length; i++) {
                          Ordered obj = Ordered(
                            username: FirebaseAuth.instance.currentUser!.email!,
                            address: selectedAddress,
                            products: orderedItems[i],
                            count: orderedCount[i],
                            status: 'Ordered',
                            payment: selectedMode.toString(),
                          );
                          obj.addToOrderedList();
                        }
                        updateQnty(widget.buynow);
                        showOrderConfirmationDialog(context);
                      } else {
                        makePayment();
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

void showOrderConfirmationDialog(BuildContext context, {bool success = true}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            StreamBuilder(
                stream: getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: LoadingIndicator(
                          indicatorType: Indicator.circleStrokeSpin,
                          colors: [Kblue],
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      iphone = data
                          .where((item) => 'iPhone' == item['category'])
                          .toList();
                      ipad = data
                          .where((item) => 'iPad' == item['category'])
                          .toList();
                      watch = data
                          .where((item) => 'iWatch' == item['category'])
                          .toList();
                      macbook = data
                          .where((item) => 'MacBook' == item['category'])
                          .toList();
                      // buyNow = allProducts
                      //     .where((item) => buyNowItem == item['id'])
                      //     .toList();
                      log("product updated ");

                      allcat = allProducts = data;

                      return Container(
                        height: 500,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Kgrey2,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              height: 340,
                              child: Center(
                                child: Image.asset(
                                  success
                                      ? "lib/assets/done.png"
                                      : "lib/assets/cancel.png",
                                  fit: BoxFit.contain,
                                  height: 120,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 160,
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    success
                                        ? 'Congratulations!'
                                        : "Something went wrong !",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    success
                                        ? 'Your order has been successfully placed.'
                                        : "Your order is not placed",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    height: 30,
                                    width: 150,
                                    // color: Kgrey3,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Kgrey2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        success
                                            ? Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNavbar(cart: false),
                                                ),
                                                (route) => false)
                                            : Navigator.pop(context);
                                      },
                                      child: Text(
                                        'OK',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  return Text('Cant fetch data');
                }),
          ]);
    },
  );
}
