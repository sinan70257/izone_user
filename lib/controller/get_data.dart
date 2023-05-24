import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';

TextEditingController name1Controller = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController houseController = TextEditingController();
TextEditingController colonyController = TextEditingController();
Stream getOrders() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('orders').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

Stream<List<DocumentSnapshot>> getProducts() async* {
  try {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    final List<DocumentSnapshot> docs = querySnapshot.docs;
    // log(docs.toString());
    yield docs;
  } catch (e) {
    // handle error
  }
}

Stream<List<DocumentSnapshot>> getImages() async* {
  try {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('feature').get();
    final List<DocumentSnapshot> docs = querySnapshot.docs;
    // log(docs.toString());
    yield docs;
  } catch (e) {
    // handle error
  }
}

Future<void> updateQnty(buy) async {
  for (int i = 0; i < orderedItems.length; i++) {
    int data = 0;
    final ref = await FirebaseFirestore.instance
        .collection('products')
        .doc(orderedItems[i])
        .get();
    if (ref.exists) {
      data = int.parse(ref.data()!['quantity']);
    }
    FirebaseFirestore.instance
        .collection('products')
        .doc(orderedItems[i])
        .update({"quantity": (data - orderedCount[i]).toString()});
  }
  if (buy == false) {
    clist.clear();
    orderedItems.clear();
    ptoatal.clear();
    countlist.clear();
    wishList my = wishList(
      address: addressLists,
      cart: clist,
      wish: wlist,
      count: countlist,
      ptotal: ptoatal,
      currentAddress: selectedAddress,
    );
    my.addToFirestoreWish();
  }
  getwish();
}

Future<void> updateStatus(product, allProduct, selectedItem) async {
  int data = 0;
  final ref = await FirebaseFirestore.instance
      .collection('products')
      .doc(allProduct['id'])
      .get();

  if (ref.exists) {
    data = ref.data()!['quantity'];
    log(data.toString());
    FirebaseFirestore.instance
        .collection('products')
        .doc(allProduct['id'])
        .update({"quantity": data + product["count"]});
  }

  FirebaseFirestore.instance
      .collection('orders')
      .doc(product['id'])
      .update({'status': selectedItem});
}
