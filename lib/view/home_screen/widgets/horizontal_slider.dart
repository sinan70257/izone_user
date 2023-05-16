import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/widgets/product_tile.dart';
import 'package:izone_user/view/widgets/product_tile2.dart';

class horizontalSlider extends StatefulWidget {
  const horizontalSlider({super.key});

  @override
  State<horizontalSlider> createState() => _horizontalSliderState();
}

class _horizontalSliderState extends State<horizontalSlider> {
  @override
  Widget build(BuildContext context) {
    log(allProducts.toString());
    return SizedBox(
        height: sHeight! / 2.4,
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
