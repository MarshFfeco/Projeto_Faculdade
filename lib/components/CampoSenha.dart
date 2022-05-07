import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class CampoSenha extends StatefulWidget {
  const CampoSenha({
    Key? key,
    required this.hinText,
    required this.keyBoardType,
    required this.altura,
    required this.pass,
  }) : super(key: key);

  final String hinText;
  final TextInputType keyBoardType;
  final double altura;
  final TextEditingController pass;

  @override
  State<CampoSenha> createState() => _CampoSenhaState();
}

class _CampoSenhaState extends State<CampoSenha> {
  final TextEditingController _pass = TextEditingController();

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
            controller: _pass,
            keyboardType: widget.keyBoardType,
            obscureText: true,
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
