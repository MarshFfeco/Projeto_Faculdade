import 'package:finalproject/Screens/MainPage/MainPage.dart';
import 'package:finalproject/components/arrasta.dart';
import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen(
      {Key? key,
      required this.explicacao,
      required this.mainPhoto,
      required this.principal,
      required this.tamanhoFoto,
      required this.photoPage})
      : super(key: key);

  final Image mainPhoto;
  final String principal;
  final String explicacao;
  final int tamanhoFoto;
  final int photoPage;

  PaginasPhoto(int photoPage) {
    switch (photoPage) {
      case 1:
        return Arrasta(
            instancia: PhotoScreen(
              tamanhoFoto: 4,
              explicacao:
                  "Clique no icone acima e tire uma foto da frente e outra do verso do seu documento",
              mainPhoto: Image.asset("assets/img/iconDocument.png"),
              principal: "Agora precisamos de uma foto do seu RG. Pode ser?",
              photoPage: 2,
            ),
            imagem: "assets/img/IconCamera.png");
      case 2:
        return Arrasta(
            instancia: PhotoScreen(
                explicacao:
                    "Clique no icone acima e tire uma foto do seu documento",
                mainPhoto: Image.asset("assets/img/iconDocument.png"),
                principal: "Agora precisamos de uma foto do seu CPF. Pode ser?",
                tamanhoFoto: 4,
                photoPage: 3),
            imagem: "assets/img/IconCamera.png");
      case 3:
        return Arrasta(
            instancia: MainPage(), imagem: "assets/img/IconCamera.png");
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: const Alignment(0.0, 1.6),
                radius: 1.0,
                colors: [CustomColor().getCorPadraoAzul, Colors.black])),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Flexible(flex: tamanhoFoto, child: mainPhoto),
            Flexible(
              flex: 2,
              child: SizedBox(width: width, child: PaginasPhoto(photoPage)),
            ),
            const Spacer(flex: 2),
            Flexible(
                child: SizedBox(
              width: width * 0.6,
              child: Text(
                principal,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )),
            const Spacer(flex: 2),
            Flexible(
              child: SizedBox(
                width: width * 0.7,
                child: Text(
                  explicacao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
