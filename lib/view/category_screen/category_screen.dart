import 'dart:developer';

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
  int selectedIndex = -1;
  void catfilter(int i) {
    setState(() {
      switch (i) {
        case 0:
          allcat = iphone;
          break;
        case 1:
          allcat = ipad;
          break;
        case 2:
          allcat = watch;
          break;
        case 3:
          allcat = macbook;
          break;

        default:
          allcat = allProducts;
      }
    });
  }

  @override
  void initState() {
    catfilter(-1);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(iphone.toString());
    // log(ipad.toString());
    // log(macbook.toString());
    // log(watch.toString());
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
                      children: filterChipsList(catfilter),
                    ),
                  ],
                ),
              ),
              productGrid(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> filterChipsList(catfilter) {
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
            if (value) {
              selectedIndex = i;
              _chipsList.forEach((element) => {element.isSelected = false});
              _chipsList[selectedIndex].isSelected = true;
            } else {
              selectedIndex = -1;
              _chipsList[i].isSelected = false;
            }
            setState(() {
              // _chipsList[selectedIndex].isSelected = value;
              catfilter(selectedIndex);
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
