import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

class orderedProducts extends StatelessWidget {
  const orderedProducts({super.key, this.product, this.data});
  final product;
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Kgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120,
      width: sWidth! / 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          space20(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product["images"][0]),
                      fit: BoxFit.cover),
                  color: Kgrey,
                  borderRadius: BorderRadius.circular(10)),
              height: sWidth! / 4.4,
              width: sWidth! / 4.4,
            ),
          ),
          space20(),
          Container(
            width: sWidth! / 2.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                space20(),
                space20(),
                Text(
                  product["name"],
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Text(
                  product["variant"],
                  style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                ),
                space10(),
                Row(
                  children: [
                    Text(
                      "₹ ${product["price"]}",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    // Spacer(),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              space20(),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "Qty : ${data["count"]}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              space20(),
              space10(),
            ],
          ),
          space20(),
        ],
      ),
    );
  }
}
