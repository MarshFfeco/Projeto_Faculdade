import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';
import 'CampoConfirmaSenha.dart';

class CampoNumero extends StatefulWidget {
  const CampoNumero({
    Key? key,
    required this.hinText,
    required this.altura,
  }) : super(key: key);

  final String hinText;
  final double altura;

  @override
  State<CampoNumero> createState() => _CampoNumeroState();
}

class _CampoNumeroState extends State<CampoNumero> {
  final TextEditingController numeroController = TextEditingController();

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
            controller: numeroController,
            keyboardType: TextInputType.phone,
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
              } else if (value is! int) {
                return "Digite apenas números";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
