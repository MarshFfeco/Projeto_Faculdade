import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class CampoTexto extends StatefulWidget {
  CampoTexto(
      {Key? key,
      required this.hinText,
      required this.textInputType,
      required this.altura})
      : super(key: key);

  final String hinText;
  final TextInputType textInputType;
  final double altura;

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.altura,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    CustomColor().getCorPadraoAzul.withOpacity(0.15),
                    Colors.black
                  ])),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: _myController,
            keyboardType: widget.textInputType,
            obscureText: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              filled: false,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: widget.hinText,
              hintStyle: TextStyle(color: Colors.white24),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                //TODO Fazer um design para quando os campos estarem vazio quando tentar fazer o login
                return "Campo Vazio";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
