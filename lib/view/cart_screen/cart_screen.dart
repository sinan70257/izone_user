import 'package:flutter/material.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/cart_screen/methods/custom_button.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/cart_list_Tile.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/product_tile.dart';
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

    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      bottomSheet: customBottomBar(),
      appBar: customAppbar(context, false, "My cart", true),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
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
                ));
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (clist.isEmpty || clist[0] == "empty") {
                  return SizedBox(
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
                  );
                }
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('List empty'))
                      : ListView.builder(
                          itemCount: clist.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product1 = data
                                .where((item) => clist.contains(item["id"]))
                                .toList();
                            final product = product1[index];

                            return cartListTile(
                              product: product,
                            );
                          });
                }
              }
              return Center(child: Text('Cant fetch items'));
            })
      ]),
    );
  }
}
