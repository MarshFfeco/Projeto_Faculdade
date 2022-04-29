import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';
import 'CampoConfirmaSenha.dart';

class CampoSenha extends StatefulWidget {
  CampoSenha(
      {Key? key,
      required this.isConfirm,
      required this.hinText,
      required this.keyBoardType,
      required this.altura})
      : super(key: key);

  final isConfirm;
  final String hinText;
  final TextInputType keyBoardType;
  final double altura;

  @override
  State<CampoSenha> createState() => _CampoSenhaState();
}

class _CampoSenhaState extends State<CampoSenha> {
  late final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _securityText = true;

  set setSecurityText(bool securityText) {
    _securityText = securityText;
  }

  bool get getSecuritytext {
    return _securityText;
  }

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
            obscureText: getSecuritytext,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20),
              filled: false,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: widget.hinText,
              hintStyle: const TextStyle(color: Colors.white24),
              hintMaxLines: 30,
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
        if (widget.isConfirm)
          const SizedBox(
            child: Text("Coloque a a senha"),
          )
        /*
        widget.isConfirm ? const SizedBox(height: 20.0) : const SizedBox(),
        widget.isConfirm
            ? TextfieldConfirmPassWidget(
                hinText: "Repetir Senha",
                pass: _pass,
              )
            : SizedBox(
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Esqueci a senha"),
                    ));
                  },
                  child: Text("Esqueci a senha?",
                      style: TextStyle(color: CustomColor().getCorPadraoAzul)),
                ),
              ),*/
      ],
    );
  }
}
