import 'package:finalproject/components/Formulario.dart';
import 'package:flutter/material.dart';

import '../../components/CampoText.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, required this.height, required this.width})
      : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    double alturaCampo = height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment(0.0, 1.7),
                    radius: 1.0,
                    colors: [Color(0xff3ef1d1), Colors.black])),
            child: FormularioCustomizado(
              campos: [
                const Spacer(flex: 2),
                CampoTexto(
                    hinText: 'Nome Completo',
                    altura: alturaCampo,
                    textInputType: TextInputType.name),
                const Spacer(flex: 2),
                CampoTexto(
                  hinText: "Data de nascimento",
                  textInputType: TextInputType.datetime,
                  altura: alturaCampo,
                ),
                const Spacer(flex: 2),
                CampoTexto(
                  hinText: "Contato do aluno",
                  textInputType: TextInputType.phone,
                  altura: alturaCampo,
                ),
                const Spacer(flex: 2),
                CampoTexto(
                  hinText: "Contato do Responsável",
                  textInputType: TextInputType.phone,
                  altura: alturaCampo,
                ),
                const Spacer(flex: 2),
                CampoTexto(
                  hinText: "Escolaridade",
                  textInputType: TextInputType.number,
                  altura: alturaCampo,
                ),
              ],
              nomeTela: "Cadastro",
              tamanhoFlex: 8,
            )

            /*ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.2,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      //decoration: BoxDecoration(color: Colors.red),
                      width: width * 0.9,
                      height: height * 0.50,
                      child: MyCustomFormSignup(
                        height: height,
                      )),
                  SizedBox(
                    height: height * 0.30,
                    child: Image.asset("assets/img/passIcon_SignUpScreen.png"),
                  )
                ],
              ),
            ],
          ),*/
            ),
      ),
    );
  }
}
