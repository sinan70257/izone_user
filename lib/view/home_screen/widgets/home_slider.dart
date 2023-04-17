import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int activeIndez = 0;
  final List<String> imgList = [
    "https://invent.irujul.com/theme/default/img/npi/npi-21/ipadpro_AI_Chip.jpg",
    "https://shop.smartone.com/storefront/banners/main/apple_watch_ultra_banner_buy_now/tchinese/apple_ultra_watch_oso_buynow.jpg",
    "https://idestiny.in/wp-content/uploads/2022/10/BANNER_FB-banner-3-2048x780.png",
    "https://i0.wp.com/store.ave.com.bn/wp-content/uploads/2022/03/iPad_Air_Web_Banner_Avail_1400x700__SEA_FFH.png?fit=1400%2C700&ssl=1",
  ];
  @override
  Widget build(BuildContext context) {
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
  Widget buildIndicator() => Center(
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndez,
          count: imgList.length,
          effect: ExpandingDotsEffect(
            dotColor: Kgrey,
            activeDotColor: Kgrey,
            dotWidth: 10,
            dotHeight: 6,
          ),
        ),
      );
}
