import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto(
      {Key? key,
      required this.hinText,
      required this.textInputType,
      required this.altura,
      required this.valorCadastrado,
      this.login = false})
      : super(key: key);

  final String hinText;
  final TextInputType textInputType;
  final double altura;
  final valorCadastrado;
  final bool login;

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          controller: textController,
          keyboardType: widget.textInputType,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            filled: false,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            hintText: widget.hinText,
            hintStyle: const TextStyle(color: Colors.white24),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Campo vazio";
            }

            if (widget.login) {
              if (value != widget.valorCadastrado) {
                return "Iconrreto";
              }
            }

            return null;
          }),
    );
  }
}
