import 'package:finalproject/Screens/FirstScreen/FirstScreen.dart';
import 'package:finalproject/Screens/Login/LoginScreen.dart';
import 'package:finalproject/Screens/SignUp/SignUpScreen.dart';
import 'package:finalproject/values/Custom_color.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F A D B A',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: //SignUpScreen(height: height, width: width)
          Container(
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
    );
  }
}

enum TelasIncriveis {
  Login,
  SignUp,
}
