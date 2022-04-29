import 'package:finalproject/components/Botao.dart';
import 'package:finalproject/components/CampoData.dart';
import 'package:finalproject/components/Formulario.dart';
import 'package:finalproject/values/Custom_color.dart';
import 'package:flutter/material.dart';

import '../../components/CampoText.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key, required this.height, required this.width})
      : super(key: key);

  final double height;
  final double width;

  DateTime selectDate = DateTime.now();

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2050, 12);

  @override
  Widget build(BuildContext context) {
    double alturaCampo = height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0.0, 1.7),
                  radius: 1.0,
                  colors: [CustomColor().getCorPadraoAzul, Colors.black])),
          child: FormularioCustomizado(
            campos: [
              const Spacer(flex: 1),
              CampoTexto(
                  hinText: 'Nome Completo',
                  altura: alturaCampo,
                  textInputType: TextInputType.name),
              const Spacer(flex: 1),
              CampoData(
                textInputType: TextInputType.datetime,
                altura: alturaCampo,
                largura: width,
              ),
              const Spacer(flex: 1),
              CampoTexto(
                hinText: "Contato do aluno",
                textInputType: TextInputType.phone,
                altura: alturaCampo,
              ),
              const Spacer(flex: 1),
              CampoTexto(
                hinText: "Contato do Responsável",
                textInputType: TextInputType.phone,
                altura: alturaCampo,
              ),
              const Spacer(flex: 1),
              CampoTexto(
                hinText: "Escolaridade",
                textInputType: TextInputType.number,
                altura: alturaCampo,
              ),
            ],
            nomeTela: "Cadastro",
            tamanhoFlex: 7,
            isCadastro: true,
          ),
        ),
      ),
    );
  }

  openDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}
