import 'package:flutter/material.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/cart_screen/methods/custom_button.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/cart_list_Tile.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
                  ..sort((a, b) =>
                      clist.indexOf(a['id']).compareTo(clist.indexOf(b['id'])));
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
      bottomSheet: customBottomBar(),
    );
  }
}

dynamic cartproduct = [];
