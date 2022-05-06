import 'package:fadba/Screens/SignUp/PhotoScreen.dart';
import 'package:fadba/components/arrasta.dart';
import 'package:flutter/material.dart';

import 'Botao.dart';
import 'CampoText.dart';
import 'CampoSenha.dart';

class FormularioCustomizado extends StatefulWidget {
  FormularioCustomizado({
    Key? key,
    required this.campos,
    required this.nomeTela,
    required this.tamanhoFlex,
  }) : super(key: key);

  List<Widget> campos;
  final String nomeTela;
  final int tamanhoFlex;

  @override
  State<FormularioCustomizado> createState() => _FormularioCustomizadoState();
}

class _FormularioCustomizadoState extends State<FormularioCustomizado> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Spacer(flex: 2),
        Flexible(
            flex: 2,
            child: Text(widget.nomeTela,
                style: const TextStyle(color: Colors.white, fontSize: 40))),
        Flexible(
          flex: widget.tamanhoFlex,
          child: SizedBox(
            width: width * 0.8,
            child: Column(
              children: widget.campos,
            ),
          ),
        ),
        //const Spacer(flex: 2),
      ],
    );
  }
}
