import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/address/add_address/add_address.dart';

class selectAddress extends StatefulWidget {
  const selectAddress({
    super.key,
  });

  @override
  State<selectAddress> createState() => _selectAddressState();
}

class _selectAddressState extends State<selectAddress> {
  getRefresh(String refresh) {
    if (refresh == 'refresh') {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              width: 120,
              child: ElevatedButton(
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Kgrey2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAddressScreen(editAdd: false),
                      ));
                  if (result == 'refresh') {
                    getRefresh('refresh');
                  }
                },
                child: Text(
                  "Add",
                ),
              ),
            ),
            space10()
          ],
        ),
        addressLists.isEmpty || addressLists[0] == "empty"
            ? Center(
                child: Text("add an address"),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: addressLists.length,
                itemBuilder: (context, index) => RadioListTile(
                  title: Container(
                    padding: EdgeInsets.all(10),
                    // height: 200,
                    // width: sWidth! / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Kgrey,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${addressLists[index]['name']}\n${addressLists[index]['houseNumber']}\n${addressLists[index]['streetName']}\n${addressLists[index]['city']}\n${addressLists[index]['state']}\n${addressLists[index]['pincode']}\n${addressLists[index]['phoneNumber']}\n",
                            style: GoogleFonts.roboto(
                              height: 1.3,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddAddressScreen(
                                          editAdd: true,
                                          index: index,
                                        ),
                                      ));
                                },
                                icon: const Icon(Icons.edit_rounded)),
                            IconButton(
                                onPressed: () {
                                  deleteAddress(index);

                                  if (addressLists.isEmpty) {
                                    selectedAddress = 'no data';

                                    wishList my = wishList(
                                      wish: wlist,
                                      cart: clist,
                                      count: countlist,
                                      ptotal: ptoatal,
                                      address: addressLists,

                                      currentAddress: selectedAddress,
                                      // buyNow: buyNowItem,
                                      // buyNowCount: buyNowCount,
                                      // buyNowTotal: buyNowTotals,
                                    );
                                    my.addToFirestoreWish();
                                    getwish();
                                  }
                                  // log(addressList.length.toString());
                                },
                                icon: const Icon(Icons.delete_outline_rounded)),
                          ],
                        )
                      ],
                    ),
                  ),
                  value: addressLists[index],
                  groupValue: selectedAddress,
                  onChanged: (value) {
                    setState(() {
                      selectedAddress = value;
                      wishList my = wishList(
                          wish: wlist,
                          cart: clist,
                          count: countlist,
                          ptotal: ptoatal,
                          address: addressLists,
                          currentAddress: selectedAddress);
                      my.addToFirestoreWish();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("address selected")));
                    });
                  },
                ),
              )
      ],
    );
  }

  void deleteAddress(int index) {
    setState(() {
      addressLists.removeAt(index);
      // Fluttertoast.showToast(
      //   msg: 'deleted',
      //   backgroundColor: deleteRed,
      // );
      wishList my = wishList(
        wish: wlist,
        cart: clist,
        count: countlist,
        ptotal: ptoatal,
        address: addressLists,
        currentAddress: selectedAddress,
      );
      my.addToFirestoreWish();
    });
  }
}
