import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/bottom%20_navbar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';
import 'package:izone_user/view/widgets/product_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class productDetails extends StatefulWidget {
  const productDetails({super.key, this.product});
  final product;

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  int activeIndez = 0;
  String? _selectedItem;
  String? _selectedItem2;
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            slider(widget.product),
            space10(),
            buildIndicator(widget.product),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space20(),
                  Text(
                    widget.product["name"],
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹ ${widget.product["price"]}",
                        style: GoogleFonts.sora(
                          height: 1.5,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Spacer(),
                      favbutton(product: widget.product)
                    ],
                  ),
                  space20(),
                  customField2(
                    read: true,
                    label: "Color",
                    // height: 200,
                    width: sWidth! / 1.1,
                    num: false,
                    max: true,
                    content: widget.product["color"],
                  ),
                  // dropDownList(
                  //     label: "Color",
                  //     height: sHeight! / 14,
                  //     width: sWidth! / 1.1,
                  //     GB: true),
                  space20(),
                  customField2(
                    read: true,
                    label: "Variant",
                    // height: 200,
                    width: sWidth! / 1.1,
                    num: false,
                    max: true,
                    content: widget.product["variant"],
                  ),
                  // dropDownList(
                  //     label: "Size",
                  //     height: sHeight! / 14,
                  //     width: sWidth! / 1.1,
                  //     GB: false),
                  space20(),
                  customField2(
                    read: true,
                    label: "About product",
                    // height: 200,
                    width: sWidth! / 1.1,
                    num: false,
                    max: true,
                    content: widget.product["description"],
                  ),
                  SizedBox(
                    height: sHeight! / 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: customBottomBar(),
    );
  }

  CarouselSlider slider(product) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        final imgLists = product["images"][index];
        return buildimage(imgLists, index);
      },
      itemCount: product["images"].length,
      options: CarouselOptions(
        onPageChanged: (index, reason) => setState(() => activeIndez = index),
        enlargeCenterPage: true,
        padEnds: true,
        viewportFraction: 0.95,
        autoPlay: false,
        height: sHeight! / 2,
      ),
    );
  }

  Widget buildimage(String url, int index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
      );

  Widget buildIndicator(product) => Center(
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndez,
          count: product["images"].length,
          effect: ExpandingDotsEffect(
            dotColor: Kgrey,
            activeDotColor: Kgrey2,
            dotWidth: 10,
            dotHeight: 10,
          ),
        ),
      );

  Column dropDownList(
      {required String label,
      required double height,
      required double width,
      required bool GB}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: GB ? dropDown1() : dropDown2(),
          decoration: BoxDecoration(
              color: Kgrey, borderRadius: BorderRadius.circular(10)),
          height: height,
          width: width,
        ),
      ],
    );
  }

  DropdownButton<String> dropDown1() {
    return DropdownButton(
      isExpanded: true,
      value: _selectedItem,
      items: const [
        DropdownMenuItem(value: 'Deep Purple', child: Text('Deep Purple')),
        DropdownMenuItem(value: 'Blue', child: Text('Blue')),
        DropdownMenuItem(value: 'Red', child: Text('Red')),
        DropdownMenuItem(value: 'Yellow', child: Text('Yellow')),
      ],
      onChanged: (value) {
        setState(() {
          _selectedItem = value;
        });
      },
    );
  }

  DropdownButton<String> dropDown2() {
    return DropdownButton(
      isExpanded: true,
      value: _selectedItem2,
      items: const [
        DropdownMenuItem(value: '64 GB', child: Text('64 GB')),
        DropdownMenuItem(value: '128 GB', child: Text('128 GB')),
        DropdownMenuItem(value: '256 GB', child: Text('256 GB')),
        DropdownMenuItem(value: '512 GB', child: Text('512 GB')),
      ],
      onChanged: (value) {
        setState(() {
          _selectedItem2 = value;
        });
      },
    );
  }

  Container customBottomBar() {
    return Container(
      decoration: BoxDecoration(
          color: Kblue,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      height: sHeight! / 10,
      child: Column(
        children: [
          space20(),
          space10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: sHeight! / 20,
                width: sWidth! / 2.5,
                margin: EdgeInsets.only(right: sWidth! / 22),
                child: TextButton(
                  onPressed: () {
                    if (clist.contains(widget.product["id"])) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Kblue,
                          content: Text("Product is already in the cart"),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(
                            cart: true,
                          ),
                        ),
                      );
                    } else {
                      clist.add(widget.product["id"]);
                      wishList my = wishList(cart: clist, wish: wlist);
                      my.addToFirestoreWish();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(
                            cart: true,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Add to cart",
                    style: GoogleFonts.sora(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Container(
                height: sHeight! / 20,
                width: sWidth! / 2.5,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Buy now",
                      style: GoogleFonts.sora(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                margin: EdgeInsets.only(right: sWidth! / 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
