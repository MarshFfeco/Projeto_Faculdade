import 'package:fadba/components/BotaoSignUp.dart';
import 'package:fadba/components/CampoData.dart';
import 'package:fadba/components/CampoEscolha.dart';
import 'package:fadba/components/CampoNumero.dart';

import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import '../../components/CampoConfirmaSenha.dart';
import '../../components/CampoText.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _formKey;
  }

  DateTime selectDate = DateTime.now();

  final firstDate = DateTime(2010, 1);

  final lastDate = DateTime(2050, 12);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double alturaCampo = height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(0.0, 1.5),
                  radius: 1.0,
                  colors: [CustomColor().getCorPadraoAzul, Colors.black])),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const Flexible(
                flex: 2,
                child: Text(
                  "Cadastro",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              const Spacer(flex: 1),
              Flexible(
                flex: 7,
                child: SizedBox(
                  width: width * 0.8,
                  child: Form(
                    key: getFormKey,
                    child: Scrollbar(
                      child: ListView(
                        children: [
                          CampoTexto(
                              hinText: 'Nome Completo',
                              altura: alturaCampo,
                              textInputType: TextInputType.name),
                          const Divider(),
                          CampoData(
                            textInputType: TextInputType.datetime,
                            altura: alturaCampo,
                          ),
                          const Divider(),
                          CampoNumero(
                            hinText: "Contato do aluno",
                            altura: alturaCampo,
                          ),
                          const Divider(),
                          CampoNumero(
                            hinText: "Contato do Responsável",
                            altura: alturaCampo,
                          ),
                          const Divider(),
                          CampoEscolha(
                            dropOpcoes: const ["Faculdade", "Fundamental"],
                            dropValue: "Faculdade",
                          ),
                          const Divider(),
                          CampoEscolha(
                              dropOpcoes: const ["Masculino", "Feminino"],
                              dropValue: "Feminino"),
                          const Divider(),
                          CampoTexto(
                              hinText: 'Email',
                              altura: alturaCampo,
                              textInputType: TextInputType.emailAddress),
                          const Divider(),
                          const SenhaRepetiSenha(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Flexible(
                flex: 2,
                child: BotaoSignUp(
                  formKey: getFormKey,
                  imagem: "assets/img/passIcon_SignUpScrenn.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
