import 'package:finalproject/components/Customform.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, required this.height, required this.width})
      : super(key: key);

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
                center: Alignment(0.0, 1.7),
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
                      "Cadastro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    //decoration: BoxDecoration(color: Colors.red),
                    width: width * 0.9,
                    height: height * 0.50,
                    child: MyCustomFormSignup(
                      height: height,
                    )),
                SizedBox(
                  height: height * 0.30,
                  child: Image.asset("assets/img/passIcon_SignUpScreen.png"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
