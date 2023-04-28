import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class slider extends StatefulWidget {
  const slider({super.key, this.images});
  final images;

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int activeIndez = 0;
  // final List<dynamic> imgList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) {
            final imgLists = widget.images[0]["images"][index];
            return buildimage(imgLists, index);
          },
          itemCount: widget.images[0]["images"].length,
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
          count: widget.images[0]["images"].length,
          effect: ExpandingDotsEffect(
            dotColor: Kgrey,
            activeDotColor: Kgrey,
            dotWidth: 10,
            dotHeight: 6,
          ),
        ),
      );
}
