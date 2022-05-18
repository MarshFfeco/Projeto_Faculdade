import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import 'components/ButtonsAdm.dart';

class AdmScreen extends StatelessWidget {
  AdmScreen({Key? key}) : super(key: key);

  final Color azul = CustomColor().getCorPadraoAzul;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: CustomColor().getCorPadraoAzul,
          ),
        ),
        title: const Text(
          "Administração",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: azul),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: ButtonAdm(
                    azul: azul,
                    titulo: "Carrossel",
                    icone: Icons.browse_gallery_outlined,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ButtonAdm(
                    azul: azul,
                    titulo: "Criar Evento",
                    icone: Icons.event_note,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            ButtonAdmType2(
              width: width,
              azul: azul,
              icone: Icons.admin_panel_settings_outlined,
              titulo: "Acesso de usuário",
            ),
            const Spacer(flex: 1),
            ButtonAdmType2(
              width: width,
              azul: azul,
              icone: Icons.message_outlined,
              titulo: "Enviar Mensagem",
            ),
            const Spacer(flex: 1),
            ButtonAdmType2(
              width: width,
              azul: azul,
              icone: Icons.post_add,
              titulo: "Criar Publicação",
            ),
            const Spacer(flex: 1),
            ButtonAdmType2(
              width: width,
              azul: azul,
              icone: Icons.person_outline,
              titulo: "Lista de Estudantes",
            ),
            const Spacer(flex: 1),
            ButtonAdmType2(
              width: width,
              azul: azul,
              icone: Icons.terminal,
              titulo: "Log",
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
