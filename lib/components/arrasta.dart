import 'package:fadba/Controller/User.dart';
import 'package:fadba/Screens/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

import '../Screens/Login/LoginScreen.dart';
import '../Screens/SignUp/SignUpScreen.dart';

class Arrasta extends StatefulWidget {
  Arrasta(
      {Key? key,
      required this.instancia,
      required this.imagem,
      this.excluirHistorico = false})
      : super(key: key);

  final dynamic instancia;
  final String imagem;
  bool excluirHistorico;

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
          if (direction == DismissDirection.startToEnd &&
              widget.excluirHistorico == false) {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => widget.instancia)));
          } else if (direction == DismissDirection.startToEnd &&
              widget.excluirHistorico == true) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => MainPage(
                          usuario: Admin(),
                        )),
                (Route<dynamic> route) => false);
          } else if (direction == DismissDirection.endToStart) {
            Navigator.pop(context);
          }
        });
      },
      key: ValueKey(isDrag),
      child: Image.asset(
        widget.imagem,
      ),
    );
  }
}
