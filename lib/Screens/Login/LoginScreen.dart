import 'package:fadba/components/Formulario.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import '../../components/Botao.dart';
import '../../components/CampoSenha.dart';
import '../../components/CampoText.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  GlobalKey get getFormKey {
    return _formKey;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    double alturaCampo = height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(0.0, 1.1),
                  radius: 1.0,
                  colors: [CustomColor().getCorPadraoAzul, Colors.black])),
          child: Form(
            key: getFormKey,
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
                  hinText: "Digite sua Senha",
                  keyBoardType: TextInputType.visiblePassword,
                  altura: alturaCampo,
                  pass: _pass,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Sua Senha"),
                        content: const Text("Problema seu"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text("OBG"))
                        ],
                      ),
                    );
                  },
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
      ),
    );
    //);
  }
}
