import 'package:flutter/material.dart';

import '../Screens/Login/LoginScreen.dart';
import '../Screens/SignUp/SignUpScreen.dart';

class Arrasta extends StatefulWidget {
  const Arrasta({Key? key, required this.instancia, required this.imagem})
      : super(key: key);

  final dynamic instancia;
  final String imagem;

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
                  MaterialPageRoute(builder: ((context) => widget.instancia)));
            } else if (direction == DismissDirection.endToStart) {
              Navigator.pop(context);
            }
          });
        },
        key: ValueKey(isDrag),
        child: Image.asset(
          widget.imagem,
        ));
  }
}
