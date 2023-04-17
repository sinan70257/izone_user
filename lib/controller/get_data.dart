import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

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
