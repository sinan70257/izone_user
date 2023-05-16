import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/model/address_model.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';

class floatingButton extends StatelessWidget {
  const floatingButton({super.key, required this.edit, this.index});
  final bool edit;

  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: sHeight! / 20,
      width: sWidth! / 1.1,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: customElevatedBotton(
            context: context,
            label: "Save",
          )),
    );
  }

  Widget customElevatedBotton({required String label, context}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: () {
          if (name1Controller.text.isEmpty ||
              phoneController.text.isEmpty ||
              pincodeController.text.isEmpty ||
              stateController.text.isEmpty ||
              cityController.text.isEmpty ||
              houseController.text.isEmpty ||
              colonyController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
                content: Text(
                  "Fill all the fields!",
                  textAlign: TextAlign.center,
                )));
          } else {
            edit ? updateAddress(context) : addAddress(context);
            clearController();
            Navigator.pop(context, "refresh");
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" $label")],
        ));
  }

  void addAddress(context) {
    Address add = Address(
        name: name1Controller.text,
        phoneNumber: phoneController.text,
        pincode: pincodeController.text,
        city: cityController.text,
        state: stateController.text,
        houseNumber: houseController.text,
        streetName: colonyController.text);
    add.addAdress();
    wishList obj = wishList(
      wish: wlist,
      cart: clist,
      count: countlist,
      ptotal: ptoatal,
      address: addressLists,
      currentAddress: selectedAddress,
    );
    obj.addToFirestoreWish();
    log(addressLists.toString());
    getwish();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("address added !")));

    clearController();
  }

  void updateAddress(context) {
    Map<String, dynamic> newAddress = {
      'name': name1Controller.text,
      'houseNumber': houseController.text,
      'streetName': colonyController.text,
      'city': cityController.text,
      'state': stateController.text,
      'pincode': pincodeController.text,
      'phoneNumber': phoneController.text,
    };

    addressLists[index] = newAddress;
    wishList obj = wishList(
      wish: wlist,
      cart: clist,
      count: countlist,
      ptotal: ptoatal,
      address: addressLists,
      currentAddress: selectedAddress,
    );
    obj.addToFirestoreWish();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("address updated !")));

    clearController();
  }
}

void clearController() {
  name1Controller.clear();
  phoneController.clear();
  pincodeController.clear();
  stateController.clear();
  cityController.clear();
  houseController.clear();
  colonyController.clear();
}
