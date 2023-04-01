import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/order_summary.dart';
import 'package:izone_user/view/product_details_screen.dart';

Widget productTile(String pName, String pPrice, context) {
  bool fav = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => productDetails(),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sWidth! / 2.1,
              height: sWidth! / 2.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://assets.shpresa.al/shop/2022/09/daac540d-cel1351-p.jpg"),
                    fit: BoxFit.cover),
                color: Kgrey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  $pName",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "  ₹ $pPrice",
                    style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        width: sWidth! / 2.1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0, left: 20),
              height: sHeight! / 30,
              width: sWidth! / 6,
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
            favbutton()
          ],
        ),
      )
    ],
  );
}

class favbutton extends StatefulWidget {
  const favbutton({
    super.key,
  });

  @override
  State<favbutton> createState() => _favbuttonState();
}

class _favbuttonState extends State<favbutton> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            fav = !fav;
          });
        },
        icon: Icon(
          fav ? Icons.favorite : Icons.favorite_border,
          color: fav ? Colors.red : Kgrey3,
        ));
  }
}
