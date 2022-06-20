import 'package:fadba/Controller/User1.dart';
import 'package:fadba/Screens/MainPage/MainPage.dart';
import 'package:fadba/Screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao(
      {Key? key,
      required this.formKey,
      required this.botaoCadastro,
      required this.nameButton,
      required this.cadastrarse,
      required this.fontSize})
      : super(key: key);

  final formKey;
  final bool botaoCadastro;
  final bool cadastrarse;
  final String nameButton;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (botaoCadastro == false && cadastrarse == false) {
            if (formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Login"),
                  content: const Text("Login Realizado com Sucesso!"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MainPage(
                                        usuario: Admin(),
                                      ))));
                        },
                        child: const Text("OK")),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancelar"))
                  ],
                ),
              );
            }
          } else if (botaoCadastro == true && cadastrarse == false) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ));
          } else if (cadastrarse) {
            if (formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Cadastro realizado com sucesso')));
              //final UserCadastro usuario = UserCadastro();
            }
          }
        },
        child: Text(
          nameButton,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ));
  }
}
