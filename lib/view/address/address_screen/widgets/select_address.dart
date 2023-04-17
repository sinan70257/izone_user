import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/add_address/add_address.dart';

class selectAddress extends StatelessWidget {
  const selectAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addAddressScreen(),
                  ));
            },
            child: Text(
              "Add",
            ),
          ),
        ),
        space10()
      ],
    );
  }
}
