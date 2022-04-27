import 'package:finalproject/Screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao(
      {Key? key,
      required this.fontSize,
      required this.formKey,
      required this.botaoCadastro,
      required this.nameButton,
      required this.cadastrarse})
      : super(key: key);

  final double fontSize;
  final formKey;
  final bool botaoCadastro;
  final bool cadastrarse;
  final String nameButton;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
        child: Text(
          nameButton,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w100),
        ),
        onTap: () {
          if (botaoCadastro == false && cadastrarse == false) {
            print("Entrar");
            if (formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processando informações')),
              );
            }
          } else if (botaoCadastro == true && cadastrarse == false) {
            print("Cadastrar");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SignUpScreen(height: height, width: width),
                ));
          } else if (cadastrarse) {
            print("Cadastrar-se");
            if (formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Cadastro realizado com sucesso')));
            }
          }
        });
  }
}
