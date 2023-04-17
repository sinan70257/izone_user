import 'package:flutter/material.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/address_screen/address_screen.dart';

class addressList extends StatefulWidget {
  const addressList({super.key});

  @override
  State<addressList> createState() => _addressListState();
}

class _addressListState extends State<addressList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: address.length,
      itemBuilder: (context, index) => RadioListTile(
        title: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          // width: sWidth! / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Kgrey,
          ),
          child: Text(address[index]),
        ),
        value: address[index],
        groupValue: selectedAddress,
        onChanged: (value) {
          setState(() {
            selectedAddress = value;
          });
        },
      ),
    );
  }
}
