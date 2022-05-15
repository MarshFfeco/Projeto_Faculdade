import 'package:fadba/Controller/User.dart';
import 'package:fadba/Screens/MainPage/components/AdmCall.dart';
import 'package:fadba/Screens/MainPage/components/Carousel.dart';
import 'package:fadba/Screens/MainPage/components/NavBar.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import 'components/Article.dart';
import 'components/Blog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Admin usuario = Admin();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final azul = CustomColor().getCorPadraoAzul;

    List<Widget> listaWidget = [
      Carousel(
        usuario: usuario,
      ),
      Center(child: AdmCall(height: height, width: width)),
      const BlogText(),
      Blog(
        usuario: usuario,
      ),
    ];
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: azul),
          backgroundColor: Colors.white,
        ),
        body: Scrollbar(
          child: ListView.builder(
            itemCount: listaWidget.length,
            itemBuilder: (context, index) => listaWidget[index],
          ),
        ));
  }
}
















      /*floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {},
        backgroundColor: azul,
      ),
      bottomNavigationBar: const BottomNavigation(),*/
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
