import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';

int selectedIndex = 0;
String? selectedAddress;
List address = [
  "Address one",
  "Address two",
  "Address thrkjfkl;ejfkldskjfkdlsjflkdsjklfjdkljfldjfkdjfkldjlfkjdskljflkdjklfjdlkjfkdjlkafjdklsjfdsjflkee",
  "Address four",
];

class addressScreen extends StatefulWidget {
  const addressScreen({super.key});

  @override
  State<addressScreen> createState() => _addressScreenState();
}

class _addressScreenState extends State<addressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, "Address"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisSize: MainAxisSize.min,
        children: [
          space10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              space20(),
              Text(
                "Select address",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 30,
                width: 60,
                child: ElevatedButton(
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Kgrey2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () {},
                  child: Text(
                    "Add",
                  ),
                ),
              ),
              space20()
            ],
          ),
          ListView.builder(
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
          ),
        ],
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
