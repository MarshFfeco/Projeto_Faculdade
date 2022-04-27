import 'package:finalproject/Screens/Login/LoginScreen.dart';
import 'package:finalproject/components/LogoPrincipal.dart';
import 'package:finalproject/main.dart';
import 'package:finalproject/values/Custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, required this.width, required this.height})
      : super(key: key);

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: height * 0.3,
          child: LogoPrincipal(
            caminhoImagem: "assets/img/logo_fadba_FirstScreen.png",
          ),
        ),
        SizedBox(
          height: height * 0.5,
        ),
        SizedBox(
          height: height * 0.15,
          child: Arrasta(
            width: width,
            height: height,
          ),
        ),
        SizedBox(
          height: height * 0.05,
          child: const Center(child: Text("Arraste para o lado")),
        )
      ],
    );
  }
}

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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => LoginScreen(
                        height: widget.height, width: widget.width))));
          } else if (direction == DismissDirection.endToStart) {
            isDrag = true;
          }
        });
      },
      key: ValueKey(isDrag),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: !isDrag
            ? Image.asset(
                "assets/img/passIcon_FirstScreen.png",
                height: widget.height * 0.1,
                width: widget.width * 0.1,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(textinho),
                  Image.asset(
                    "assets/img/passIcon_FirstScreen.png",
                    height: widget.height * 0.1,
                    width: widget.width * 0.1,
                  )
                ],
              ),
      ),
    );
  }
}
