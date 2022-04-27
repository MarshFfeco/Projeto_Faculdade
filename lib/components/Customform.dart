import 'package:flutter/material.dart';

import 'Botao.dart';
import 'CampoText.dart';
import 'CampoSenha.dart';

class MyCustomFormLogin extends StatefulWidget {
  const MyCustomFormLogin({Key? key, required this.height}) : super(key: key);

  final height;

  @override
  State<MyCustomFormLogin> createState() => _MyCustomFormLoginState();
}

class _MyCustomFormLoginState extends State<MyCustomFormLogin> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _formKey;
  }

  @override
  Widget build(BuildContext context) {
    double diferenca = 20.0;
    double alturaCampo = widget.height * 0.07;
    return Form(
      key: _formKey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: diferenca * 2),
          SizedBox(
            height: alturaCampo,
            child: CampoTexto(
              hinText: 'Usuário ou Email',
              textInputType: TextInputType.emailAddress,
              altura: alturaCampo,
            ),
          ),
          SizedBox(height: diferenca * 1.5),
          SizedBox(
            child: Column(
              children: [
                CampoSenha(
                  keyBoardType: TextInputType.visiblePassword,
                  altura: alturaCampo,
                  hinText: "Senha",
                  isConfirm: false,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text("Esqueci a senha?",
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: diferenca),
          SizedBox(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Botao(
                    fontSize: 40.0,
                    formKey: _formKey,
                    botaoCadastro: false,
                    cadastrarse: false,
                    nameButton: "Entrar"),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "OU",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Botao(
                    fontSize: 18.0,
                    formKey: _formKey,
                    botaoCadastro: true,
                    cadastrarse: false,
                    nameButton: "Faça seu cadastro"),
              ),
            ]),
          ),
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
