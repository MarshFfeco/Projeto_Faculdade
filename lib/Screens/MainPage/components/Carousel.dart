import 'package:carousel_slider/carousel_slider.dart';
import 'package:fadba/Controller/User.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key, required this.usuario}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final usuario;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final azul = CustomColor().getCorPadraoAzul;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    int tamanhoLista = widget.usuario.getImagemCaroseul.length;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.3,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: tamanhoLista,
            itemBuilder: (BuildContext context, int index, int realindex) {
              String images = widget.usuario.getImagemCaroseul[index];

              return buildImage(images, index);
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
          buildidicator(tamanhoLista),
        ],
      ),
    );
  }

  buildImage(String images, int index) {
    return GestureDetector(
      onTap: null,
      child: Image.asset(
        images,
        fit: BoxFit.cover,
      ),
    );
  }

  buildidicator(int tamanhoLista) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: tamanhoLista,
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
