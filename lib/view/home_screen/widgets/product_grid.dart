import 'package:easy_stepper/easy_stepper.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/widgets/product_tile.dart';

class productGrid extends StatefulWidget {
  const productGrid({super.key});

  @override
  State<productGrid> createState() => _productGridState();
}

class _productGridState extends State<productGrid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getProducts(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Text('list empty')
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final product = data![index];
                        return productTile(product["name"], product["price"],
                            context, product);
                      });
            }
          }
          return Text('Error');
        });
  }
}
