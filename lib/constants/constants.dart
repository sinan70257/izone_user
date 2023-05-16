import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';

double? sHeight;
double? sWidth;
TextEditingController searchController = TextEditingController();

const kHeight = SizedBox(height: 10);
const kHeight20 = SizedBox(height: 20);
const kWidth = SizedBox(width: 100);
// ignore: non_constant_identifier_names
Color Kgrey = const Color.fromRGBO(217, 217, 217, 1);
Color Kgrey2 = const Color.fromARGB(255, 59, 59, 59);
Color Kgrey3 = Color.fromARGB(255, 78, 78, 78);
Color white = Colors.white;
Color black = Colors.black;

Color Kblue = Color.fromARGB(255, 0, 129, 234);
Widget space10() {
  return SizedBox(
    height: sHeight! / 120,
    width: sHeight! / 120,
  );
}

Widget space20() {
  return SizedBox(
    height: sHeight! / 60,
    width: sHeight! / 60,
  );
}

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}

dynamic img;

bool selected = false;
List wlist = [];
List clist = [];
List countlist = [];
List ptoatal = [];
int? total;
List iphone = [];
List ipad = [];
List macbook = [];
List watch = [];
List allcat = [];
List allProducts = [];
List searchlist = [];
List addressLists = [];
dynamic selectedAddress;

class wishList {
  List<dynamic> wish;
  List<dynamic> cart;
  List<dynamic> count;
  List address;
  List ptotal;
  dynamic currentAddress;

  wishList({
    required this.wish,
    required this.cart,
    required this.count,
    required this.ptotal,
    required this.address,
    required this.currentAddress,
  });
  Future<void> addToFirestoreWish() async {
    final ref = FirebaseFirestore.instance.collection('user');
    final docRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
    // String id = docRef.id;
    Map<String, dynamic> toMap() {
      return {
        'wishlist': wish,
        "cartlist": cart,
        "countlist": countlist,
        "totallist": ptotal,
        "address": address,
        "selectedAddress": currentAddress,
      };
    }

    await docRef.set(toMap());
  }
}

Future getwish() async {
  final ref = await FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .get();
  if (ref.exists) {
    final data = ref.data()!["wishlist"];
    wlist = data ?? ["empty"];
    if (wlist.length > 1 && wlist[0] == "empty") {
      wlist.removeAt(0);
    }
  } else {
    wlist = ["empty"];
  }
  if (ref.exists) {
    final data = ref.data()!["cartlist"];
    clist = data ?? ["empty"];
    if (clist.length > 1 && clist[0] == "empty") {
      clist.removeAt(0);
    }
  } else {
    clist = ["empty"];
  }
  if (ref.exists) {
    final data = ref.data()!["countlist"];
    countlist = data ?? ["empty"];
    if (countlist.length > 1 && countlist[0] == "empty") {
      countlist.removeAt(0);
    }
  } else {
    clist = ["empty"];
  }
  if (ref.exists) {
    final data = ref.data()!["totallist"];
    ptoatal = data ?? ["empty"];
    if (ptoatal.length > 1 && ptoatal[0] == "empty") {
      ptoatal.removeAt(0);
    }
  } else {
    ptoatal = ["empty"];
  }
  if (ref.exists) {
    final data = ref.data()!["address"];
    addressLists = data ?? ["empty"];
    if (addressLists.length > 1 && addressLists[0] == "empty") {
      addressLists.removeAt(0);
    }
  } else {
    addressLists = ["empty"];
  }
  if (ref.exists) {
    final data = ref.data()!["selectedAddress"];
    selectedAddress = data ?? ["empty"];
    if (selectedAddress.length > 1 && selectedAddress[0] == "empty") {
      selectedAddress.removeAt(0);
    }
  } else {
    selectedAddress = ["empty"];
  }

  log("cartlist :" + clist.toString());

  log("wishlist :" + wlist.toString());
}
