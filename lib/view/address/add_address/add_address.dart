import 'package:flutter/material.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/address/add_address/widgets/floating_button.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/custom_text_field.dart';

// class addAddressScreen extends StatelessWidget {
//   addAddressScreen({super.key, this.edit = false, this.index = 0});
//   bool edit;
//   int index;

//   @override
//   Widget build(BuildContext context) {
//     if (!edit) {
//       clearController();
//     }
//     sHeight = MediaQuery.of(context).size.height;
//     sWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: customAppbar2(context, edit ? "edit address" : "add address"),
//       body: SizedBox(
//         height: sHeight,
//         width: sWidth,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               customField2(
//                 controller: edit
//                     ? name1Controller =
//                         TextEditingController(text: addressLists[index]["name"])
//                     : name1Controller,
//                 label: "Full name",
//                 height: sHeight! / 15,
//                 width: sWidth! / 1.1,
//                 num: false,
//                 max: 50,
//                 readOnly: false,
//               ),
//               customField2(
//                 controller: edit
//                     ? phoneController = TextEditingController(
//                         text: addressLists[index]["phoneNumber"])
//                     : phoneController,
//                 label: "Phone no",
//                 height: sHeight! / 15,
//                 width: sWidth! / 1.1,
//                 num: true,
//                 max: 50,
//                 readOnly: false,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   customField2(
//                     controller: edit
//                         ? pincodeController = TextEditingController(
//                             text: addressLists[index]["pincode"])
//                         : pincodeController,
//                     label: "Pin code",
//                     height: sHeight! / 15,
//                     width: sWidth! / 2.4,
//                     num: true,
//                     max: 50,
//                     readOnly: false,
//                   ),
//                   customField2(
//                     controller: edit
//                         ? stateController = TextEditingController(
//                             text: addressLists[index]["state"])
//                         : stateController,
//                     label: "State",
//                     height: sHeight! / 15,
//                     width: sWidth! / 2.4,
//                     num: false,
//                     max: 50,
//                     readOnly: false,
//                   ),
//                 ],
//               ),
//               customField2(
//                 controller: edit
//                     ? cityController =
//                         TextEditingController(text: addressLists[index]["city"])
//                     : cityController,
//                 label: "City",
//                 height: sHeight! / 15,
//                 width: sWidth! / 1.1,
//                 num: false,
//                 max: 50,
//                 readOnly: false,
//               ),
//               customField2(
//                 controller: edit
//                     ? houseController = TextEditingController(
//                         text: addressLists[index]["houseNumber"])
//                     : houseController,
//                 label: "House no, building name",
//                 height: sHeight! / 15,
//                 width: sWidth! / 1.1,
//                 num: false,
//                 max: 50,
//                 readOnly: false,
//               ),
//               customField2(
//                 controller: edit
//                     ? colonyController = TextEditingController(
//                         text: addressLists[index]["streetName"])
//                     : colonyController,
//                 label: "Road name, Area, Colony",
//                 height: sHeight! / 15,
//                 width: sWidth! / 1.1,
//                 num: false,
//                 max: 50,
//                 readOnly: false,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: floatingButton(
//         edit: edit,
//         ctx: context,
//         index: index,
//       ),
//     );
//   }
// }

final formKey = GlobalKey<FormState>();

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key, this.editAdd = false, this.index});
  final index;
  final editAdd;

  @override
  Widget build(BuildContext context) {
    if (!editAdd) {
      clearController();
    }
    return Scaffold(
      appBar: customAppbar2(context, editAdd ? 'Edit address' : 'Add address'),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              customField2(
                  label: 'Name',
                  height: 60,
                  width: sWidth!,
                  num: false,
                  max: 1,
                  controller: editAdd
                      ? name1Controller = TextEditingController(
                          text: addressLists[index]['name'])
                      : name1Controller,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Name can\'t be empty';
                    }
                  }),
              kHeight,
              customField2(
                  label: 'Phone number',
                  height: 60,
                  width: sWidth!,
                  num: true,
                  max: 1,
                  controller: editAdd
                      ? phoneController = TextEditingController(
                          text: addressLists[index]['phoneNumber'])
                      : phoneController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Number can\'t be empty';
                    }
                  },
                  number: true),
              kHeight,
              Row(
                children: [
                  customField2(
                    label: 'Pincode',
                    height: 60,
                    width: sWidth! / 2.5,
                    num: true,
                    max: 1,
                    controller: editAdd
                        ? pincodeController = TextEditingController(
                            text: addressLists[index]['pincode'])
                        : pincodeController,
                    readOnly: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'pincode can\'t be empty';
                      }
                    },
                    number: true,
                  ),
                  customField2(
                      label: 'City',
                      height: 60,
                      width: sWidth! / 2.5,
                      num: false,
                      max: 1,
                      controller: editAdd
                          ? cityController = TextEditingController(
                              text: addressLists[index]['city'])
                          : cityController,
                      readOnly: false,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'city can\'t be empty';
                        }
                      }),
                ],
              ),
              kHeight,
              customField2(
                  label: 'State',
                  height: 60,
                  width: sWidth!,
                  num: false,
                  max: 1,
                  controller: editAdd
                      ? stateController = TextEditingController(
                          text: addressLists[index]['state'])
                      : stateController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'state can\'t be empty';
                    }
                  }),
              kHeight,
              customField2(
                  label: 'House no: / building no:',
                  height: 60,
                  width: sWidth!,
                  num: false,
                  max: 3,
                  controller: editAdd
                      ? houseController = TextEditingController(
                          text: addressLists[index]['houseNumber'])
                      : houseController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'House can\'t be empty';
                    }
                  }),
              kHeight,
              customField2(
                  label: 'Area ,street',
                  height: 60,
                  width: sWidth!,
                  num: false,
                  max: 3,
                  controller: editAdd
                      ? colonyController = TextEditingController(
                          text: addressLists[index]['streetName'])
                      : colonyController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Street can\'t be empty';
                    }
                  }),
              kHeight,
              // kHeight100,
              kHeight20,
              floatingButton(
                index: index,
                edit: editAdd,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
