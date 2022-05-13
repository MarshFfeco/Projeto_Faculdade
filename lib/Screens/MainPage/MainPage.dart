import 'package:carousel_slider/carousel_slider.dart';
import 'package:fadba/Screens/MainPage/components/AdmCall.dart';
import 'package:fadba/Screens/MainPage/components/Article.dart';
import 'package:fadba/Screens/MainPage/components/Carousel.dart';
import 'package:fadba/Screens/MainPage/components/NavBar.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final azul = CustomColor().getCorPadraoAzul;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: azul),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        SizedBox(
          width: double.infinity,
          height: height * 0.3,
          child: const Carousel(),
        ),
        Center(
          child: AdmCall(
            height: height,
            width: width,
          ),
        ),
        SizedBox(
          height: height * 0.60,
          width: width,
          child: Blog(),
        )
      ]),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {},
        backgroundColor: azul,
      ),
      bottomNavigationBar: const BottomNavigation(),*/
    );
  }
}
/*
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: IconTheme(
        data: const IconThemeData(color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.all(12.00),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.circle_outlined,
                ),
                Icon(
                  Icons.notifications_active,
                ),
                Icon(
                  Icons.book_outlined,
                ),
                Icon(
                  Icons.calendar_month_outlined,
                ),
                SizedBox(width: 20)
              ]),
        ),
      ),
    );
  }
}*/
