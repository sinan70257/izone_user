import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/product_tile.dart';

class cartListTile extends StatelessWidget {
  const cartListTile({
    super.key,
    this.product,
  });
  final product;

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
              height: sWidth! / 4.4,
              width: sWidth! / 4.4,
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
              ),
            ),
          ),
          space20(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space20(),
              space20(),
              Container(
                width: 150,
                child: Text(
                  product["name"],
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              ),
              Text(
                product["variant"],
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ),
              space10(),
              Text(
                "₹ ${product["price"]}",
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
              productCounter(
                productid: product["id"],
                qty: int.parse(product["quantity"]),
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

class productCounter extends StatefulWidget {
  productCounter({
    super.key,
    required this.productid,
    required this.qty,
  });
  final int qty;

  final productid;

  @override
  State<productCounter> createState() => _productCounterState();
  int count = 0;
}

class _productCounterState extends State<productCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeight! / 31,
      width: 80,
      decoration:
          BoxDecoration(color: Kgrey2, borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (widget.count == 0) {
                  clist.remove(widget.productid);
                  wishList my = wishList(wish: wlist, cart: clist);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 800),
                      content: Text("Product removed from cart!"),
                    ),
                  );
                } else {
                  widget.count--;
                }
              });
            },
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Container(
            height: 23,
            width: 25,
            decoration: BoxDecoration(
              color: Kgrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "${widget.count + 1}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (widget.count == widget.qty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 800),
                      content: Text("Limit reached !"),
                    ),
                  );
                  getwish();
                } else {
                  widget.count++;
                }
              });
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
