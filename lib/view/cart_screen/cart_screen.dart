import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/orders_screen/order_summary.dart';
import 'package:izone_user/view/widgets/cart_list_Tile.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
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

    bool a = false;
    getRefresh(String refresh) {
      if (refresh == 'refresh') {
        setState(() {
          a = true;
        });
      }
    }

    updateTotal();

    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: white,
        appBar: customAppbar(context, false, "My cart", true),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          if (clist.isEmpty || clist[0] == "empty")
            SizedBox(
              height: sHeight! / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset("lib/assets/empty cart.jpg"),
                  ),
                ],
              ),
            )
          else
            ListView.builder(
                itemCount: clist.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product1 = allProducts
                      .where((item) => clist.contains(item['id']))
                      .toList()
                    ..sort((a, b) => clist
                        .indexOf(a['id'])
                        .compareTo(clist.indexOf(b['id'])));
                  final product = product1[index];
                  cartproduct = product1;

                  return cartListTile(
                    index: index,
                    onRemove: onRemove,
                    product: product,
                    updateTotal: updateTotal,
                  );
                })
        ]),
        bottomSheet: Container(
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
                        onPressed: () async {
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
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => orderDetails()));
                            if (result == 'refresh') {
                              getRefresh('refresh');
                            }
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
        ));
  }
}

dynamic cartproduct = [];
