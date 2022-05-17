import 'package:fadba/components/arrasta.dart';
import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';
import '../Login/LoginScreen.dart';

class LastPageSignUp extends StatelessWidget {
  const LastPageSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: const Alignment(0.0, 1.5),
                radius: 1.0,
                colors: [CustomColor().getCorPadraoAzul, Colors.black])),
        height: height,
        width: width,
        child: Column(
          children: [
            const Spacer(flex: 4),
            Flexible(
              flex: 3,
              child: Textozinho("cadastro", 40),
            ),
            const Spacer(flex: 5),
            Flexible(
              flex: 3,
              child: Container(
                child: Textozinho("Cadastro Realizado com Sucesso", 30),
              ),
            ),
            const Spacer(flex: 2),
            Flexible(
              flex: 3,
              child: Image.asset("assets/img/healthicons_happy.png"),
            ),
            const Spacer(flex: 5),
            Flexible(
              flex: 3,
              child: Arrasta(
                  excluirHistorico: true,
                  instancia: LoginScreen(),
                  imagem: "assets/img/passIcon_SignUpScrenn.png"),
            )
          ],
        ),
      ),
    );
  }

  Text Textozinho(String texto, double tTexto) => Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: tTexto,
        ),
        textAlign: TextAlign.center,
      );
}
