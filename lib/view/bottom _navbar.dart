import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/cart_screen.dart';
import 'package:izone_user/view/category_screen.dart';
import 'package:izone_user/view/profile_screen.dart';
import 'package:izone_user/view/wishlist_screen.dart';
import '../view/home_screen.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatefulWidget {
  BottomNavbar({super.key});
  int currentIndex = 0;
  List pages = [
    homeScreen(),
    cartScreen(),
    categoryScreen(),
    wishList(),
    profileScreen()
  ];

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // bottomSheet: const FloatingController(),
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingNavbar(
          unselectedItemColor: Colors.black,
          borderRadius: 45,
          width: MediaQuery.of(context).size.width / 1.1,
          itemBorderRadius: 45,
          selectedBackgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          backgroundColor: Kgrey,
          currentIndex: widget.currentIndex,
          onTap: (newCurrentIndex) {
            setState(() {
              widget.currentIndex = newCurrentIndex;
            });
          },
          // currentIndex: widget.currentIndex,
          items: <FloatingNavbarItem>[
            FloatingNavbarItem(
              icon: Icons.home_filled,

              // title: const Text(
              //   "Home",
              //   style: TextStyle(color: Colors.white),
              // ),
            ),
            FloatingNavbarItem(
              icon: Icons.shopping_cart_outlined,
            ),
            // title: const Text(
            //   'Playlists',
            //   style: TextStyle(color: Colors.white),
            // ),

            FloatingNavbarItem(
              icon: Icons.category_outlined,
            ),
            FloatingNavbarItem(
              icon: Icons.favorite_rounded,
            ),
            FloatingNavbarItem(
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}