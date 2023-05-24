import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/product_details/product_details_screen.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldKey,
      backgroundColor: white,
      appBar: customAppbar(context, false, "Wish List", true),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        if (wlist.isEmpty || wlist[0] == "empty")
          SizedBox(
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
          ),
        ListView.builder(
            itemCount:
                wlist.contains("empty") ? wlist.length - 1 : wlist.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final product1 = allProducts
                  .where((item) => wlist.contains(item["id"]))
                  .toList()
                ..sort((a, b) =>
                    wlist.indexOf(a['id']).compareTo(wlist.indexOf(b['id'])));
              final product = product1[index];

              return wishListTile(product, index);
              // WishListCard(product: product);
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
            wishList my = wishList(
              address: addressLists,
              wish: wlist,
              cart: clist,
              count: countlist,
              ptotal: ptoatal,
              currentAddress: selectedAddress,
            );
            my.addToFirestoreWish();
            getwish();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
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
          Icons.remove_circle_outline,
          color: Kgrey2,
        ));
  }
}
