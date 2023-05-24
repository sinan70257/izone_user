import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/order_details/order_summary.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ordersScreen extends StatefulWidget {
  const ordersScreen({super.key});

  @override
  State<ordersScreen> createState() => _ordersScreenState();
}

class _ordersScreenState extends State<ordersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppbar3(context, "Orders"),
      body: StreamBuilder(
          stream: getOrders(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                height: 50,
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  colors: [Kblue],
                  strokeWidth: 1,
                ),
              ));
            }
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                List filteredList1 = data
                    .where((item) =>
                        item['username'] ==
                        FirebaseAuth.instance.currentUser!.email)
                    .toList();

                return filteredList1.isEmpty
                    ? Center(
                        child: Image.asset('lib/assets/empty order copy.jpg'),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredList1.length,
                        itemBuilder: (context, index) {
                          final filteredList = filteredList1
                              .expand((item) => allProducts
                                  .where((product) =>
                                      item['products'].contains(product['id']))
                                  .toList()
                                ..sort((a, b) => filteredList1
                                    .indexOf(a['id'])
                                    .compareTo(filteredList1.indexOf(b['id']))))
                              .toList();

                          final product = filteredList[index];

                          return orderTile(
                            index: index,
                            product: product,
                            data: filteredList1[index],
                          );
                        });
              }
            }
            return const Text('Cant fetch data');
          }),
    );
  }

  AppBar customAppbar(
      BuildContext context, bool home, String title, bool black) {
    return AppBar(
      automaticallyImplyLeading: false,
      // centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: sHeight! / 20, right: sWidth! / 12),
          child: home
              ? IconButton(
                  onPressed: () {
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(builder: (context) => loginScreen()),
                    //     (route) => false);
                    // logout();
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: sWidth! / 12,
                  ),
                )
              : SizedBox(),
        ),
      ],

      title: home
          ? Padding(
              padding: EdgeInsets.only(top: sHeight! / 20),
              child: SizedBox(
                  height: sWidth! / 7,
                  child:
                      Image.asset('lib/assets/iZone.png', fit: BoxFit.cover)),
            )
          : Padding(
              padding: EdgeInsets.only(top: sHeight! / 20),
              child: Text(
                " $title",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                )),
              ),
            ),

      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: sHeight! / 8, // default is 56
      toolbarOpacity: 1,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: black ? [Colors.black, Colors.black] : [Kblue, Kblue],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }

  AppBar customAppbar3(BuildContext context, String label) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(top: sWidth! / 10, left: sWidth! / 15),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      title: Padding(
        padding: EdgeInsets.only(top: sHeight! / 13),
        child: SizedBox(
          height: sWidth! / 7,
          child: Text(
            label,
            style: GoogleFonts.sora(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: sHeight! / 8, // default is 56
      toolbarOpacity: 1,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Colors.black, Colors.black],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}

class orderTile extends StatelessWidget {
  const orderTile({super.key, this.index, this.product, this.data});
  final index;
  final product;
  final data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DeliveryStatusPage(product: product, data: data),
          )),
      child: Container(
        height: 70,
        // width: sWidth! / 1.2,
        decoration: BoxDecoration(
          color: Kgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                      product["images"][0],
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            space20(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: sWidth! / 2.4,
                  child: Text(
                    product["name"],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                space10(),
                Text(
                  "₹ ${product["price"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                data["status"],
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            space20(),
          ],
        ),
      ),
    );
  }
}
