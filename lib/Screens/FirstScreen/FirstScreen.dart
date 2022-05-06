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
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0.0, 1.1),
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
                instancia: LoginScreen(),
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
    );
  }
}

/*
class Arrasta extends StatefulWidget {
  const Arrasta({Key? key, required this.width, required this.height})
      : super(key: key);

  final height;
  final width;

  @override
  State<Arrasta> createState() => _ArrastaState();
}

class _ArrastaState extends State<Arrasta> {
  final String textinho = "ARRASTE PARA A DIREITA";
  bool isDrag = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        resizeDuration: null,
        onDismissed: (direction) {
          setState(() {
            if (direction == DismissDirection.startToEnd) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen())));
            } else if (direction == DismissDirection.endToStart) {
              Navigator.pop(context);
            }
          });
        },
        key: ValueKey(isDrag),
        child: Image.asset(
          "assets/img/passIcon_FirstScreen.png",
        ));
  }
}
*/