import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';

GridView ProductGrid() {
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: (sHeight! / 1.05 / sWidth! / 3.02),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemCount: 20,
      itemBuilder: (BuildContext ctx, index) {
        // return productTile("iPhone 14 Pro", "89,990", context);
      });
}
