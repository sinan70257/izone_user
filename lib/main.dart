import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:izone_user/view/address/add_address/add_address.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';
import 'package:izone_user/view/bottom%20_navbar.dart';
import 'package:izone_user/view/cart_screen/cart_screen.dart';
import 'package:izone_user/view/category_screen/category_screen.dart';
import 'package:izone_user/view/home_screen/home_screen.dart';
import 'package:izone_user/view/order_summary.dart';
import 'package:izone_user/view/product_details_screen.dart';
import 'package:izone_user/view/profile_screen.dart';
import 'package:izone_user/view/splash_screen.dart';
import 'package:izone_user/view/wishlist_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}
