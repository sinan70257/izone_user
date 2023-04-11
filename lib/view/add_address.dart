import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';

class addAddressScreen extends StatefulWidget {
  const addAddressScreen({super.key});

  @override
  State<addAddressScreen> createState() => _addAddressScreenState();
}

class _addAddressScreenState extends State<addAddressScreen> {
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: customAppbar2(context, "Add address"),
      body: SizedBox(
        height: sHeight,
        width: sWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              customField2(
                  label: "Full name",
                  height: sHeight! / 15,
                  width: sWidth! / 1.1,
                  num: false,
                  max: false,
                  read: false,
                  content: ""),
              customField2(
                  label: "Phone no",
                  height: sHeight! / 15,
                  width: sWidth! / 1.1,
                  num: true,
                  max: false,
                  read: false,
                  content: ""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customField2(
                      label: "Pin code",
                      height: sHeight! / 15,
                      width: sWidth! / 2.4,
                      num: true,
                      max: false,
                      read: false,
                      content: ""),
                  customField2(
                      label: "State",
                      height: sHeight! / 15,
                      width: sWidth! / 2.4,
                      num: false,
                      max: false,
                      read: false,
                      content: ""),
                ],
              ),
              customField2(
                  label: "City",
                  height: sHeight! / 15,
                  width: sWidth! / 1.1,
                  num: false,
                  max: false,
                  read: false,
                  content: ""),
              customField2(
                  label: "House no, building name",
                  height: sHeight! / 15,
                  width: sWidth! / 1.1,
                  num: false,
                  max: false,
                  read: false,
                  content: ""),
              customField2(
                  label: "Road name, Area, Colony",
                  height: sHeight! / 15,
                  width: sWidth! / 1.1,
                  num: false,
                  max: false,
                  read: false,
                  content: ""),
            ],
          ),
        ),
      ),
      bottomNavigationBar: floatingButton(),
    );
  }

  Widget floatingButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: sHeight! / 20,
      width: sWidth! / 1.1,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: customElevatedBotton(
            label: "Save",
          )),
    );
  }

  Widget customElevatedBotton({required String label}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" $label")],
        ));
  }
}
