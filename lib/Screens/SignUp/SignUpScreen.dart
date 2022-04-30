import 'package:finalproject/components/Botao.dart';
import 'package:finalproject/components/CampoData.dart';
import 'package:finalproject/components/CampoEscolha.dart';
import 'package:finalproject/components/CampoNumero.dart';
import 'package:finalproject/components/CampoSenha.dart';
import 'package:finalproject/components/Formulario.dart';
import 'package:finalproject/values/Custom_color.dart';
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
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.red,
              gradient: RadialGradient(
                  center: Alignment(0.0, 1.5),
                  radius: 1.0,
                  colors: [CustomColor().getCorPadraoAzul, Colors.black])),
          child: Form(
            key: getFormKey,
            child: Column(
              children: [
                SizedBox(height: height * 0.09),
                const SizedBox(
                    child: Text("Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                SizedBox(height: height * 0.03),
                SizedBox(
                  width: width * 0.8,
                  child: CampoTexto(
                      hinText: 'Nome Completo',
                      altura: alturaCampo,
                      textInputType: TextInputType.name),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  width: width * 0.8,
                  child: CampoData(
                    textInputType: TextInputType.datetime,
                    altura: alturaCampo,
                    largura: width,
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  width: width * 0.8,
                  child: CampoNumero(
                    hinText: "Contato do aluno",
                    altura: alturaCampo,
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  width: width * 0.8,
                  child: CampoNumero(
                    hinText: "Contato do Responsável",
                    altura: alturaCampo,
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(width: width * 0.8, child: const CampoEscolha()),
                SizedBox(height: height * 0.03),
                SizedBox(
                  width: width * 0.8,
                  child: CampoTexto(
                    hinText: "Email",
                    textInputType: TextInputType.emailAddress,
                    altura: alturaCampo,
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(width: width * 0.8, child: const SenhaRepetiSenha()),
                SizedBox(height: height * 0.03),
                Botao(
                    formKey: getFormKey,
                    botaoCadastro: false,
                    nameButton: "Cadastrar",
                    cadastrarse: true,
                    fontSize: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
