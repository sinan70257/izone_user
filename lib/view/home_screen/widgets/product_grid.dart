import 'package:easy_stepper/easy_stepper.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/product_tile.dart';

class productGrid extends StatefulWidget {
  const productGrid({super.key, this.search = false});
  final search;

  @override
  State<productGrid> createState() => _productGridState();
}

class _productGridState extends State<productGrid> {
  @override
  Widget build(BuildContext context) {
    return (widget.search ? searchlist.length : allProducts.length) > 0
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: widget.search ? searchlist.length : allProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              final product =
                  widget.search ? searchlist[index] : allProducts[index];
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
