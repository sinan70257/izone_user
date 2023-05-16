import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/product_tile.dart';

// GridView ProductGrid(BuildContext context) {
//   return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 300,
//           childAspectRatio: (sHeight! / 1.05 / sWidth! / 3.02),
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15),
//       itemCount: allcat.length,
//       itemBuilder: (BuildContext ctx, index) {
//         return productTile(allcat[index]["name"], allcat[index]["price"],
//             context, allcat[index]);
//       });
// }
class productGrid extends StatefulWidget {
  const productGrid({super.key});

  @override
  State<productGrid> createState() => _productGridState();
}

class _productGridState extends State<productGrid> {
  @override
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: (sHeight! / 1.05 / sWidth! / 3.02),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemCount: allcat.length,
        itemBuilder: (BuildContext ctx, index) {
          return productTile(allcat[index]["name"], allcat[index]["price"],
              context, allcat[index]);
        });
  }
}
