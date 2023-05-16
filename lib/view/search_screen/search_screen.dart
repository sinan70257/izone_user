import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/home_screen/widgets/product_grid.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  void initState() {
    searchlist = allProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                autofocus: true,
                controller: searchController,
                cursorColor: Kgrey3,
                style: TextStyle(color: white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Kgrey),
                  suffixIcon: IconButton(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Icon(Icons.clear, color: Kgrey),
                      onPressed: () {
                        if (searchController.text.isNotEmpty) {
                          searchController.clear();
                          setState(() {
                            searchlist = allProducts;
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      }),
                  filled: true,
                  fillColor: Kgrey2,
                  hintStyle: TextStyle(color: Kgrey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Search . . .',
                ),
                onChanged: (value) {
                  log(value);
                  setState(() {
                    searchlist = allProducts
                        .where((element) => element['name']
                            .toLowerCase()
                            .replaceAll(RegExp(r"\s+"), "")
                            .replaceAll(RegExp(r"[()]"), "")
                            .contains(value
                                .toLowerCase()
                                .replaceAll(RegExp(r"\s+"), "")))
                        .toList();
                  });

                  log(searchlist.length.toString());
                },
              ),
            ),
          ],
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: sHeight! / 8, // default is 56
        toolbarOpacity: 1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [black, black],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => productGrid(search: true),
              itemCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
