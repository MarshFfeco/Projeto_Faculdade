import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class SenhaRepetiSenha extends StatefulWidget {
  const SenhaRepetiSenha({
    Key? key,
    this.onSaved,
  }) : super(key: key);
  final void Function(String? text)? onSaved;

  @override
  State<SenhaRepetiSenha> createState() => _SenhaRepetiSenhaState();
}

class _SenhaRepetiSenhaState extends State<SenhaRepetiSenha> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    double alturaCampo = height * 0.06;
    return Column(
      children: [
        Container(
          height: alturaCampo,
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
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              filled: false,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: "Senha",
              hintStyle: TextStyle(color: Colors.white24),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo Vazio";
              } else if (value.length < 8) {
                return "Senha muito pequena";
              }
              return null;
            },
          ),
        ),
        const Divider(),
        Container(
          height: alturaCampo,
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
            onSaved: widget.onSaved,
            style: const TextStyle(color: Colors.white),
            controller: confirmPass,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              filled: false,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: "Repetir Senha",
              hintStyle: TextStyle(color: Colors.white24),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo Vazio";
              }
              if (_pass.text != confirmPass.text) {
                return "Senha diferente";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
