import 'package:camera/camera.dart';
import 'package:fadba/Screens/SignUp/PhotoScreen.dart';
import 'package:fadba/Screens/SignUp/SignUpScreen.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import 'Screens/FirstScreen/FirstScreen.dart';

main() {
  runApp(
    const MaterialApp(
      title: "F A D B A",
      home: Scaffold(
        body: FirstScreen(),
      ),
    ),
  );
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F A D B A',
      home: PhotoScreen(
        camera: widget.fCamera,
        explicacao: "Teste",
        mainPhoto: Image.asset("assets/img/iconDocument.png"),
        principal: "teste",
        tamanhoFoto: 4,
        photoPage: 1);,
    );
  }
}
*/
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.fCamera}) : super(key: key);

  final dynamic fCamera;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return PhotoScreen(
        camera: widget.fCamera,
        explicacao: "Teste",
        mainPhoto: Image.asset("assets/img/iconDocument.png"),
        principal: "teste",
        tamanhoFoto: 4,
        photoPage: 1);
    /*Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment(0.0, 1.1),
                radius: 1.0,
                colors: [CustomColor().getCorPadraoAzul, Colors.black])),
        child: FirstScreen(
          height: height,
          width: width,
        ),
      ),
    );*/
  }
}
*/