import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/product_details_screen.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/product_tile.dart';
import 'package:loading_indicator/loading_indicator.dart';

class wishListScreen extends StatefulWidget {
  const wishListScreen({super.key});

  @override
  State<wishListScreen> createState() => _wishListScreenState();
}

class _wishListScreenState extends State<wishListScreen> {
  @override
  Widget build(BuildContext context) {
    getwish();
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      appBar: customAppbar(context, false, "Wish List", true),
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
                if (wlist.isEmpty || wlist[0] == "empty") {
                  return SizedBox(
                    height: sHeight! / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset("lib/assets/oops.jpg"),
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
                          itemCount: wlist.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product1 = data
                                .where((item) => wlist.contains(item["id"]))
                                .toList();
                            final product = product1[index];

                            return wishListTile(product, index);
                            // WishListCard(product: product);
                          });
                }
              }
              return Center(child: Text('Cant fetch items'));
            })
      ]),
    );
  }

  Widget wishListTile(product, index) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => productDetails(product: product),
          )),
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 6, right: 6),
        height: sHeight! / 9,
        width: sWidth! / 1.05,
        decoration: BoxDecoration(
          color: Kgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            space10(),
            Container(
                width: sWidth! / 5,
                height: sWidth! / 5,
                decoration: BoxDecoration(),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image.asset("lib/assets/izone place holder.jpg"),
                  imageUrl: product["images"][0],
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            space20(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    product["name"],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: sWidth! / 22)),
                  ),
                ),
                Text(
                  product["variant"],
                ),
                space10(),
                Text(
                  "₹ ${product["price"]}",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: sWidth! / 21),
                  ),
                )
              ],
            ),
            Spacer(),
            // favbutton(),
            deleteWish(product),
            space20(),
          ],
        ),
      ),
    );
  }

  IconButton deleteWish(product) {
    return IconButton(
        onPressed: () {
          setState(() {
            // getwish();
            wlist.remove(product["id"]);
            wishList my = wishList(wish: wlist, cart: clist);
            my.addToFirestoreWish();
            getwish();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                duration: const Duration(seconds: 1),
                content: Text(
                  "${product["name"].toString().trimRight()} removed from wishlist",
                  style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w500, color: black)),
                ),
              ),
            );
          });
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ));
  }
}
