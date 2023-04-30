import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/order_summary.dart';
import 'package:izone_user/view/product_details_screen.dart';

Widget productTile(String pName, String pPrice, context, product) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    width: 200,
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
                  margin: EdgeInsets.only(top: 5),
                  width: sWidth! / 2.2,
                  height: sWidth! / 2.2,
                  alignment: Alignment.center,
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$pName",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "₹ $pPrice",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0, left: 10),
                height: sHeight! / 30,
                width: sWidth! / 4.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => orderDetails(),
                        ));
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

class favbutton extends StatefulWidget {
  const favbutton({
    super.key,
    this.product,
  });
  final product;

  @override
  State<favbutton> createState() => _favbuttonState();
}

class _favbuttonState extends State<favbutton> {
  bool? fav;

  @override
  Widget build(BuildContext context) {
    // getwish();
    if (wlist.contains(widget.product["id"])) {
      fav = true;
    } else {
      fav = false;
    }

    return IconButton(
        onPressed: () {
          getwish();
          setState(() {
            if (fav == false) {
              wlist.add(widget.product["id"]);

              wishList my = wishList(wish: wlist, cart: clist);
              my.addToFirestoreWish();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.fixed,
                  backgroundColor: black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  duration: const Duration(seconds: 1),
                  content: Text(
                    "${widget.product["name"].toString().trimRight()} added to wishlist",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: white, fontWeight: FontWeight.w600)),
                  ),
                ),
              );
            } else {
              wlist.remove(widget.product["id"]);
              wishList my = wishList(wish: wlist, cart: clist);
              my.addToFirestoreWish();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.fixed,
                  backgroundColor: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  duration: const Duration(seconds: 1),
                  content: Text(
                    "${widget.product["name"].toString().trimRight()} removed from wishlist",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: black)),
                  ),
                ),
              );
            }
            fav = !fav!;
          });
        },
        icon: Icon(
          fav! ? Icons.favorite : Icons.favorite_border,
          color: fav! ? Colors.red : Kgrey3,
        ));
  }
}

class wishList {
  List<dynamic> wish;
  List<dynamic> cart;
  wishList({required this.wish, required this.cart});
  Future<void> addToFirestoreWish() async {
    final ref = FirebaseFirestore.instance.collection('user');
    final docRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
    // String id = docRef.id;
    Map<String, dynamic> toMap() {
      return {
        'wishlist': wish,
        "cartlist": cart,
      };
    }

    await docRef.set(toMap());
  }
}

Future getwish() async {
  final ref = await FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .get();
  if (ref.exists) {
    final data = ref.data()!["wishlist"];
    wlist = data ?? ["empty "];
    if (wlist.length > 1 && wlist[0] == "empty") {
      wlist.removeAt(0);
    }
  } else {
    wlist = ["empty"];
  }
  if (ref.exists) {
    final data = ref.data()!["cartlist"];
    clist = data ?? ["empty "];
    if (clist.length > 1 && clist[0] == "empty") {
      clist.removeAt(0);
    }
  } else {
    clist = ["empty"];
  }

  log("cartlist :" + clist.toString());

  log("wishlist :" + wlist.toString());
}
