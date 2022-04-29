import 'package:finalproject/Screens/SignUp/PhotoScreen.dart';
import 'package:finalproject/components/arrasta.dart';
import 'package:flutter/material.dart';

import 'Botao.dart';
import 'CampoText.dart';
import 'CampoSenha.dart';

class FormularioCustomizado extends StatefulWidget {
  FormularioCustomizado(
      {Key? key,
      required this.campos,
      required this.nomeTela,
      required this.tamanhoFlex,
      required this.isCadastro})
      : super(key: key);

  List<Widget> campos;
  final String nomeTela;
  final int tamanhoFlex;
  final bool isCadastro;

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
            ),
          ),
          const Spacer(flex: 2),
          widget.isCadastro
              ? Flexible(
                  flex: 1,
                  child: SizedBox(
                      width: double.infinity,
                      child: Arrasta(
                          imagem: "assets/img/passIcon_SignUpScrenn.png",
                          instancia: PhotoScreen(
                            tamanhoFoto: 6,
                            explicacao:
                                "Clique no icone acima e tire uma selfie para conhecermos você",
                            mainPhoto: Image.asset("assets/img/IconPerson.png"),
                            principal:
                                " Agora precisamos de uma foto sua. Pode ser?",
                            photoPage: 1,
                          ))),
                )
              : Container()
        ],
      ),
    );
  }
}
