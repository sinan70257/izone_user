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
    return SizedBox(
      height: sHeight! / 2.4,
      child: StreamBuilder(
          stream: getProducts(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Kgrey,
                  color: Kblue,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return snapshot.data!.isEmpty
                    ? Text('list empty')
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product = data![index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: productTile2(product["name"],
                                product["price"], context, product),
                          );
                        });
              }
            }
            return Text("Error: Product");
          }),
    );
  }
}
