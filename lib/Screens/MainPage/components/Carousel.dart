import 'package:carousel_slider/carousel_slider.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final azul = CustomColor().getCorPadraoAzul;
  int activeIndex = 0;
  final urlImages = [
    "assets/carousel/img_1.png",
    "assets/carousel/img_2.jpg",
    "assets/carousel/img_3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.3,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (BuildContext context, int index, int realindex) {
              final urlImage = urlImages[index];

              return BuildImage(urlImage);
            },
            options: CarouselOptions(
                enableInfiniteScroll: false,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reson) {
                  setState(() {
                    activeIndex = index;
                  });
                }),
          ),
          Buildidicator(),
        ],
      ),
    );
  }

  BuildImage(String urlImage) {
    return GestureDetector(
      onTap: null,
      child: Image.asset(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Buildidicator() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: urlImages.length,
          effect: WormEffect(
            dotColor: Colors.black12,
            activeDotColor: azul,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      ),
    );
  }
}
