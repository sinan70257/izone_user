import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/category_screen/methods/product_grid.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen({super.key});

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, false, "Category", true),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: sHeight! / 20,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: filterChipsList(),
                    ),
                  ],
                ),
              ),
              ProductGrid(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget productTile(
  //   String pName,
  //   String pPrice,
  // ) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       InkWell(
  //         onTap: () {
  //           Navigator.of(context).push(MaterialPageRoute(
  //             builder: (context) => productDetails(),
  //           ));
  //         },
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(
  //               width: sWidth! / 2.1,
  //               height: sWidth! / 2.1,
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                     image: NetworkImage(
  //                         "https://assets.shpresa.al/shop/2022/09/daac540d-cel1351-p.jpg"),
  //                     fit: BoxFit.cover),
  //                 color: Kgrey,
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 15.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "  $pName",
  //                     style: GoogleFonts.poppins(
  //                       textStyle: TextStyle(
  //                           fontSize: 18, fontWeight: FontWeight.w500),
  //                     ),
  //                   ),
  //                   Text(
  //                     "  ₹ $pPrice",
  //                     style: GoogleFonts.inter(
  //                       textStyle: TextStyle(
  //                           fontSize: 15, fontWeight: FontWeight.w500),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //       Container(
  //         margin: EdgeInsets.only(top: 5, left: 20),
  //         height: sHeight! / 30,
  //         width: sWidth! / 6,
  //         child: ElevatedButton(
  //           onPressed: () {},
  //           child: Text(
  //             "Buy",
  //             style: TextStyle(fontSize: 14),
  //           ),
  //           style: ElevatedButton.styleFrom(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  List<Widget> filterChipsList() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          avatar: _chipsList[i].isSelected
              ? Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : null,
          selectedColor: Colors.black,
          label: Text(
            _chipsList[i].label,
          ),
          labelStyle: TextStyle(
              color: _chipsList[i].isSelected ? Colors.white : Colors.black,
              fontSize: 16),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  final List<ItemModel> _chipsList = [
    ItemModel("iPhone", Kgrey, false),
    ItemModel("iPad", Kgrey, false),
    ItemModel("iWatch", Kgrey, false),
    ItemModel("Macbook", Kgrey, false),
  ];
}
