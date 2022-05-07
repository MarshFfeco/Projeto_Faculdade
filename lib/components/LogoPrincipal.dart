import 'package:flutter/material.dart';

class LogoPrincipal extends StatelessWidget {
  LogoPrincipal({
    Key? key,
    required this.caminhoImagem,
  }) : super(key: key);

  String caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Image.asset(caminhoImagem),
    );
  }
}
