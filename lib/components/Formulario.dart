import 'package:flutter/material.dart';

import 'Botao.dart';
import 'CampoText.dart';
import 'CampoSenha.dart';

class FormularioCustomizado extends StatefulWidget {
  FormularioCustomizado(
      {Key? key,
      required this.campos,
      required this.nomeTela,
      required this.tamanhoFlex})
      : super(key: key);

  List<Widget> campos;
  final String nomeTela;
  final int tamanhoFlex;

  @override
  State<FormularioCustomizado> createState() => _FormularioCustomizadoState();
}

class _FormularioCustomizadoState extends State<FormularioCustomizado> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _formKey;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
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
              ))
        ],
      ),
    );
  }
}

class MyCustomFormSignup extends StatefulWidget {
  const MyCustomFormSignup({Key? key, required this.height}) : super(key: key);

  final height;

  @override
  _MyCustomFormSignupState createState() => _MyCustomFormSignupState();
}

class _MyCustomFormSignupState extends State<MyCustomFormSignup> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _formKey;
  }

  @override
  Widget build(BuildContext context) {
    double alturaCampo = widget.height * 0.06;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: CampoTexto(
                hinText: 'Nome Completo',
                altura: alturaCampo,
                textInputType: TextInputType.name),
          ),
          SizedBox(
            child: CampoTexto(
              hinText: "Data de nascimento",
              textInputType: TextInputType.datetime,
              altura: alturaCampo,
            ),
          ),
          SizedBox(
            child: CampoTexto(
              hinText: "Contato do aluno",
              textInputType: TextInputType.phone,
              altura: alturaCampo,
            ),
          ),
          SizedBox(
            child: CampoTexto(
              hinText: "Contato do Responsável",
              textInputType: TextInputType.phone,
              altura: alturaCampo,
            ),
          ),
          SizedBox(
            child: CampoTexto(
              hinText: "Escolaridade",
              textInputType: TextInputType.number,
              altura: alturaCampo,
            ),
          ),
        ],
      ),
    );
  }
}
