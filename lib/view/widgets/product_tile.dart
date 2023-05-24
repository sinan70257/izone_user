import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/orders_screen/order_summary.dart';
import 'package:izone_user/view/product_details/product_details_screen.dart';

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
                child: slider(image: product),
                // child: CachedNetworkImage(
                //   placeholder: (context, url) =>
                //       Image.asset("lib/assets/izone place holder.jpg"),
                //   imageUrl: product["images"][0],
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.0),
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "₹ $pPrice",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        int.parse(product["quantity"]) > 0
                            ? const Text(
                                "In stock  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              )
                            : const Text(
                                "out of stock  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                      ],
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
              if (wlist.contains(widget.product["id"])) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.fixed,
                    backgroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    duration: const Duration(seconds: 1),
                    content: Text(
                      "${widget.product["name"].toString().trimRight()} already in wish list",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500, color: black)),
                    ),
                  ),
                );
              } else {
                wlist.add(widget.product["id"]);

                wishList my = wishList(
                  address: addressLists,
                  wish: wlist,
                  cart: clist,
                  count: countlist,
                  ptotal: ptoatal,
                  currentAddress: selectedAddress,
                );
                my.addToFirestoreWish();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.fixed,
                    backgroundColor: black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    duration: const Duration(seconds: 1),
                    content: Text(
                      "${widget.product["name"].toString().trimRight()} added to wishlist",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                );
              }
            } else {
              wlist.remove(widget.product["id"]);
              wishList my = wishList(
                address: addressLists,
                wish: wlist,
                cart: clist,
                count: countlist,
                ptotal: ptoatal,
                currentAddress: selectedAddress,
              );
              my.addToFirestoreWish();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.fixed,
                  backgroundColor: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  duration: const Duration(seconds: 1),
                  content: Text(
                    "${widget.product["name"].toString().trimRight()} removed from wishlist",
                    textAlign: TextAlign.center,
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

class slider extends StatefulWidget {
  const slider({super.key, this.image});
  final image;

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int activeIndez = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        final imgLists = widget.image["images"][index];
        return buildimage(imgLists, index);
      },
      itemCount: widget.image["images"].length,
      options: CarouselOptions(
        scrollPhysics: ClampingScrollPhysics(),
        onPageChanged: (index, reason) => setState(() => activeIndez = index),
        // enlargeCenterPage: true,
        // padEnds: true,
        pageSnapping: true,
        viewportFraction: 0.95,
        autoPlay: false,
        height: sHeight! / 2,
      ),
    );
  }
}

Widget buildimage(String url, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        placeholder: (context, url) =>
            Image.asset("lib/assets/izone place holder.jpg"),
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
