import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto(
      {Key? key,
      required this.hinText,
      required this.textInputType,
      required this.altura,
      required this.valorCadastrado,
      this.onSaved,
      this.onChanged,
      this.Validator,
      this.obscureText = false,
      this.login = false})
      : super(key: key);

  final void Function(String? text)? onSaved;
  final void Function(String? text)? onChanged;
  final String? Function(String? text)? Validator;
  final bool obscureText;
  final String hinText;
  final TextInputType textInputType;
  final double altura;
  final valorCadastrado;
  final bool login;

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
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
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: widget.onSaved,
          style: const TextStyle(color: Colors.white),
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
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
          validator: widget.Validator),
    );
  }
}
