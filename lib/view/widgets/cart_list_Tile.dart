import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';

class cartListTile extends StatelessWidget {
  const cartListTile({
    super.key,
  });

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
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.shopify.com/s/files/1/0568/5942/7015/products/MKJP3HN_A_1.png?v=1633758334"),
                      fit: BoxFit.cover),
                  color: Kgrey,
                  borderRadius: BorderRadius.circular(10)),
              height: sWidth! / 4.4,
              width: sWidth! / 4.4,
            ),
          ),
          space20(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space20(),
              space20(),
              Text(
                "Watch Series 7",
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Text(
                "32 GB",
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ),
              space10(),
              Row(
                children: [
                  Text(
                    "₹ 49,990",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  // Spacer(),
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              space20(),
              const Icon(Icons.cancel),
              const Spacer(),
              Container(
                height: sHeight! / 31,
                width: 80,
                decoration: BoxDecoration(
                    color: Kgrey2, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    Container(
                      height: 23,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Kgrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ],
                ),
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
