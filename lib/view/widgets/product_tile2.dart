import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/order_summary.dart';
import 'package:izone_user/view/product_details_screen.dart';

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
                width: sWidth! / 2.1,
                height: sWidth! / 2.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product["images"][0]),
                      fit: BoxFit.cover),
                  color: Kgrey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: Text(
                        "$pName",
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    space10(),
                    Text(
                      "MRP ₹ $pPrice.00\n(Incl. of all taxes)",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0, left: 8),
                height: sHeight! / 30,
                width: sWidth! / 3,
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
    ),
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
