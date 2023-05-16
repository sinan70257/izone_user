import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

TextEditingController name1Controller = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController houseController = TextEditingController();
TextEditingController colonyController = TextEditingController();

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
