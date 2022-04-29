import 'package:finalproject/Screens/Login/LoginScreen.dart';
import 'package:finalproject/components/LogoPrincipal.dart';
import 'package:flutter/material.dart';

import '../../components/arrasta.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, required this.width, required this.height})
      : super(key: key);

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Column(
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