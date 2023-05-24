import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/product_tile.dart';

class productGrid extends StatelessWidget {
  const productGrid({super.key, this.search = false});
  final search;

  Widget build(BuildContext context) {
    return (search ? searchlist.length : allProducts.length) > 0
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.63,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: search ? searchlist.length : allProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              final product = search ? searchlist[index] : allProducts[index];
              return productTile(
                  product["name"], product["price"], context, product);
            })
        : SizedBox(
            height: sHeight! / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("lib/assets/nothing found.jpg"),
                ),
              ],
            ),
          );
  }
}
