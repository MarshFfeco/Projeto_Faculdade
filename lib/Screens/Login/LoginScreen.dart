import 'package:finalproject/components/Customform.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment(0.0, 1.1),
                radius: 1.0,
                colors: [Color(0xff3ef1d1), Colors.black])),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height * 0.2,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.55,
                  child: MyCustomFormLogin(
                    height: height,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
