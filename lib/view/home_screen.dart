import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/splash_screen.dart';
import 'package:izone_user/view/widgets/custom_app_bar.dart';
import 'package:izone_user/view/widgets/product_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _honeScreenState();
}

class _honeScreenState extends State<homeScreen> {
  int activeIndez = 0;
  final List<String> imgList = [
    "https://invent.irujul.com/theme/default/img/npi/npi-21/ipadpro_AI_Chip.jpg",
    "https://shop.smartone.com/storefront/banners/main/apple_watch_ultra_banner_buy_now/tchinese/apple_ultra_watch_oso_buynow.jpg",
    "https://idestiny.in/wp-content/uploads/2022/10/BANNER_FB-banner-3-2048x780.png",
    "https://i0.wp.com/store.ave.com.bn/wp-content/uploads/2022/03/iPad_Air_Web_Banner_Avail_1400x700__SEA_FFH.png?fit=1400%2C700&ssl=1",
  ];

  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppbar(context, true, "", true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            space10(),
            slider(),
            space10(),
            productTitle(" New Arrivals"),
            horizontalSlider(),
            space10(),
            productTitle(" All products"),
            productGrid(),
          ],
        ),
      ),
    );
  }

  GridView productGrid() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 10,
          mainAxisSpacing: 1,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext ctx, index) {
          return productTile("iPhone 14 Pro", "89,990", context);
        });
  }

  Widget horizontalSlider() {
    return SizedBox(
      height: sHeight! / 2.9,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: productTile("iPhone 14 Pro", "89,990", context),
              )),
    );
  }

  Text productTitle(String label) {
    return Text(
      label,
      style: GoogleFonts.sora(
          textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
    );
  }

  Widget slider() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) {
            final imgLists = imgList[index];
            return buildimage(imgLists, index);
          },
          itemCount: imgList.length,
          options: CarouselOptions(
            onPageChanged: (index, reason) =>
                setState(() => activeIndez = index),
            enlargeCenterPage: true,
            padEnds: true,
            viewportFraction: 0.98,
            autoPlay: true,
            height: sHeight! / 4.5,
          ),
        ),
        space10(),
        buildIndicator()
      ],
    );
  }

  Widget buildimage(String url, int index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
      );

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    setState(
      () {
        isloggedIn1 = false;
      },
    );
  }

  Widget buildIndicator() => Center(
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndez,
          count: imgList.length,
          effect: ExpandingDotsEffect(
            dotColor: Kgrey,
            activeDotColor: Kgrey2,
            dotWidth: 10,
            dotHeight: 6,
          ),
        ),
      );
}
