import 'package:fadba/Screens/Login/LoginScreen.dart';
import 'package:fadba/components/LogoPrincipal.dart';
import 'package:flutter/material.dart';

import '../../components/arrasta.dart';
import '../../values/Custom_color.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: const Alignment(0.0, 1.1),
                radius: 1.0,
                colors: [CustomColor().getCorPadraoAzul, Colors.black])),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: LogoPrincipal(
                caminhoImagem: "assets/img/logo_fadba_FirstScreen.png",
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Arrasta(
                  imagem: "assets/img/passIcon_FirstScreen.png",
                  instancia: const LoginScreen(),
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  "Arraste para o lado",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
