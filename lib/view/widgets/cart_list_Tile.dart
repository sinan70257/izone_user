// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';
import 'package:izone_user/view/product_details/product_details_screen.dart';

class cartListTile extends StatelessWidget {
  const cartListTile(
      {super.key,
      this.product,
      this.onRemove,
      this.index,
      this.updateTotal,
      this.ordered = false,
      this.buyn = false});
  final product;

  final onRemove;
  final index;
  final updateTotal;
  final bool ordered;
  final buyn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (buyn == false) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => productDetails(product: product),
              ));
        }
      },
      child: Container(
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
              child: SizedBox(
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
                SizedBox(
                  width: 150,
                  child: Text(
                    product["name"],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ),
                Text(
                  product["variant"],
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                ),
                space10(),
                Text(
                  "₹ ${product["price"]}",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                space20(),
                InkWell(
                    onTap: () {
                      buyn ? buynowoCount = 1 : onRemove(product["id"]);
                      buyn ? buynow.clear() : countlist.removeAt(index);
                      buyn ? buynowtotal = 0 : ptoatal.removeAt(index);

                      wishList my = wishList(
                        address: addressLists,
                        wish: wlist,
                        cart: clist,
                        count: countlist,
                        ptotal: ptoatal,
                        currentAddress: selectedAddress,
                      );
                      my.addToFirestoreWish();
                      updateTotal();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          duration: Duration(milliseconds: 800),
                          content: Text(
                            "Product removed from cart!",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.cancel)),
                const Spacer(),
                ordered
                    ? Text("Qty :${countlist[index]} ")
                    : productCounter(
                        updateTotal: updateTotal,
                        index: index,
                        onRemove: onRemove,
                        product: product,
                        buyn: buyn,
                        qty: int.parse(product["quantity"]),
                      ),
                space20(),
                space10(),
              ],
            ),
            space20(),
          ],
        ),
      ),
    );
  }
}

class productCounter extends StatefulWidget {
  productCounter({
    super.key,
    required this.product,
    required this.qty,
    required this.onRemove,
    this.index,
    this.buyn,
    this.updateTotal,
  });
  final int qty;
  final onRemove;
  final product;
  final index;
  final updateTotal;
  final buyn;

  @override
  State<productCounter> createState() => _productCounterState();
}

class _productCounterState extends State<productCounter> {
  @override
  Widget build(BuildContext context) {
    int count = widget.buyn ? buynowoCount : countlist[widget.index];
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
                if (widget.buyn ? buynowoCount == 1 : count == 1) {
                  // clist.remove(widget.productid);
                  widget.buyn
                      ? buynow.clear()
                      : widget.onRemove(widget.product["id"]);
                  widget.buyn
                      ? buynowoCount = 1
                      : countlist.removeAt(widget.index);
                  widget.buyn
                      ? buynowtotal = 0
                      : ptoatal.removeAt(widget.index);

                  wishList my = wishList(
                    wish: wlist,
                    address: addressLists,
                    cart: clist,
                    count: countlist,
                    ptotal: ptoatal,
                    currentAddress: selectedAddress,
                  );
                  my.addToFirestoreWish();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 800),
                      content: Text(
                        "Product removed from cart!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  widget.updateTotal();
                } else {
                  widget.buyn ? buynowoCount-- : count--;
                  widget.buyn ? buynowoCount : countlist[widget.index] = count;
                  widget.buyn
                      ? buynowtotal =
                          buynowoCount * int.parse(widget.product["price"])
                      : ptoatal[widget.index] =
                          count * int.parse(widget.product["price"]);

                  wishList my = wishList(
                    address: addressLists,
                    wish: wlist,
                    cart: clist,
                    count: countlist,
                    ptotal: ptoatal,
                    currentAddress: selectedAddress,
                  );
                  my.addToFirestoreWish();
                  widget.updateTotal();
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
                widget.buyn ? "$buynowoCount" : "$count",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (count == widget.qty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 800),
                      content: Text(
                        "Prodkuct limit reached !",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  widget.buyn ? buynowoCount++ : count++;
                  widget.buyn ? buynowoCount : countlist[widget.index] = count;
                  widget.buyn
                      ? buynowtotal =
                          buynowoCount * int.parse(widget.product["price"])
                      : ptoatal[widget.index] =
                          count * int.parse(widget.product["price"]);

                  wishList my = wishList(
                    address: addressLists,
                    wish: wlist,
                    cart: clist,
                    count: countlist,
                    ptotal: ptoatal,
                    currentAddress: selectedAddress,
                  );
                  my.addToFirestoreWish();
                  widget.updateTotal();
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
