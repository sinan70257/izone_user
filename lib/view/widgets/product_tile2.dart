import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/orders_screen/order_summary.dart';
import 'package:izone_user/view/product_details/product_details_screen.dart';
import 'package:izone_user/view/widgets/product_tile.dart';

Widget productTile2(String pName, String pPrice, context, product) {
  bool fav = false;
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 238, 238, 238),
      borderRadius: BorderRadius.circular(10),
    ),
    width: 200,
    height: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => productDetails(product: product),
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  width: 180,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: NetworkImage(product["images"][0]),
                    //     fit: BoxFit.cover),
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(
                      "lib/assets/izone place holder.jpg",
                      fit: BoxFit.cover,
                    ),
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: Text(
                        "$pName",
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    space10(),
                    Text(
                      "MRP ₹ $pPrice.00\n(Incl. of all taxes)",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              // space20(),
            ],
          ),
        ),
        Container(
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 28,
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    if (int.parse(product["quantity"]) > 0) {
                      buynow.insert(0, product["id"]);
                      if (buynow.length > 1) {
                        buynow.removeLast();
                      }
                      buynowtotal = int.parse(product["price"]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => orderDetails(buynow: true),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.red,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14))),
                          content: const SizedBox(
                            height: 51,
                            child: Center(
                              child: Text("Out of stock ! ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            ),
                          )));
                    }
                  },
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Spacer(),
              favbutton(
                product: product,
              )
            ],
          ),
        )
      ],
    ),
  );
}

// class favbutton extends StatefulWidget {
//   const favbutton({
//     super.key,
//   });

//   @override
//   State<favbutton> createState() => _favbuttonState();
// }

// class _favbuttonState extends State<favbutton> {
//   bool fav = false;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           setState(() {
//             fav = !fav;
//           });
//         },
//         icon: Icon(
//           fav ? Icons.favorite : Icons.favorite_border,
//           color: fav ? Colors.red : Kgrey3,
//         ));
//   }
// }
