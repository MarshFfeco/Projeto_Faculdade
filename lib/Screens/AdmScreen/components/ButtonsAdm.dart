import 'package:flutter/material.dart';

class ButtonAdm extends StatelessWidget {
  const ButtonAdm(
      {Key? key, required this.titulo, required this.icone, required this.azul})
      : super(key: key);

  final String titulo;
  final IconData icone;
  final Color azul;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(titulo),
            content: const Text("Em Desenvolvimento"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"))
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 4, offset: Offset(0, 4))
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, right: 20.0, bottom: 30.0, left: 20.0),
              child: Icon(
                icone,
                size: 100,
                color: azul,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonAdmType2 extends StatelessWidget {
  const ButtonAdmType2(
      {Key? key,
      required this.width,
      required this.azul,
      required this.icone,
      required this.titulo})
      : super(key: key);

  final double width;
  final Color azul;
  final String titulo;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(titulo),
            content: const Text("Em Desenvolvimento"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"))
            ],
          ),
        );
      },
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 4, offset: Offset(0, 4))
            ]),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Icon(
              icone,
              color: azul,
              size: 40,
            ),
          ),
          Text(titulo),
          const Spacer(
            flex: 1,
          ),
          Icon(
            Icons.arrow_right,
            color: azul,
            size: 40,
          )
        ]),
      ),
    );
  }
}
