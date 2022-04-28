import 'package:finalproject/components/Formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/Botao.dart';
import '../../components/CampoSenha.dart';
import '../../components/CampoText.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _formKey;
  }

  LoginScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    double alturaCampo = height * 0.05;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0.0, 1.1),
                  radius: 1.0,
                  colors: [Color(0xff3ef1d1), Colors.black])),
          child: FormularioCustomizado(
            campos: [
              const Spacer(
                flex: 2,
              ),
              CampoTexto(
                  hinText: "Usuário ou Email",
                  textInputType: TextInputType.emailAddress,
                  altura: alturaCampo),
              const Spacer(
                flex: 2,
              ),
              CampoSenha(
                  isConfirm: false,
                  hinText: "Digite sua Senha",
                  keyBoardType: TextInputType.visiblePassword,
                  altura: alturaCampo),
              TextButton(
                onPressed: () {},
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text("Esqueci a senha?",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const Spacer(flex: 2),
              Botao(
                  fontSize: 40.0,
                  formKey: _formKey,
                  botaoCadastro: false,
                  cadastrarse: false,
                  nameButton: "Entrar"),
              const Text(
                "OU",
                style: TextStyle(color: Colors.white),
              ),
              Botao(
                  fontSize: 18.0,
                  formKey: _formKey,
                  botaoCadastro: true,
                  cadastrarse: false,
                  nameButton: "Faça seu cadastro"),
              const Spacer(flex: 5),
            ],
            nomeTela: "Login",
            tamanhoFlex: 7,
          ),
        ),
      ),
    );
    //);
  }
}
