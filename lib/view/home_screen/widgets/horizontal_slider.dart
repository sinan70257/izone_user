import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/product_tile2.dart';

class horizontalSlider extends StatelessWidget {
  const horizontalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    log(allProducts.toString());
    return SizedBox(
        height: sHeight! / 2.2,
        child: ListView.builder(
            // reverse: true,
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = allProducts[10 - index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: productTile2(
                    product["name"], product["price"], context, product),
              );
            }));
  }
}
