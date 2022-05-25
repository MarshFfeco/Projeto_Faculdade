import 'dart:ui';

import 'package:fadba/Screens/MainPage/components/NavBar.dart';
import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class PerfilScreen extends StatefulWidget {
  PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final azul = CustomColor().getCorPadraoAzul;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back),
          color: azul,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            MyInformation(height: height, width: width),
            Divider(color: azul, thickness: 1.0),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 21, 87, 107)))),
                  Expanded(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 9, 10, 10))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyInformation extends StatelessWidget {
  const MyInformation({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.35,
      width: width,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "http://s2.glbimg.com/kmbgBzKPL0URISIQenPiAKo4ORI=/e.glbimg.com/og/ed/f/original/2017/08/23/5c147f01-dff6-4952-98a0-9394c88361c2.jpg",
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Mariana Pereira da Silva",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.person,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "(00) 0 0000-0000",
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
