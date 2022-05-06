import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../Screens/SignUp/PhotoScreen.dart';

class BotaoSignUp extends StatefulWidget {
  const BotaoSignUp(
      {Key? key,
      required this.formKey,
      // required this.instancia,
      required this.imagem})
      : super(key: key);

  final formKey;
  // final dynamic instancia;
  final String imagem;

  @override
  State<BotaoSignUp> createState() => _BotaoSignUpState();
}

class _BotaoSignUpState extends State<BotaoSignUp> {
  bool isDrag = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        resizeDuration: null,
        onDismissed: (direction) {
          setState(() {
            if (widget.formKey.currentState!.validate()) {
              if (direction == DismissDirection.startToEnd) {
                chamada();
                return;
              }
              if (direction == DismissDirection.endToStart) {
                Navigator.pop(context);
              }
            }
          });
        },
        key: ValueKey(isDrag),
        child: Image.asset(widget.imagem));
  }

  Future<void> chamada() async {
    print("chamou?");
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => PhotoScreen(
              explicacao:
                  "Clique no icone acima e tire uma selfie para conhecermos você",
              mainPhoto: Image.asset("assets/img/IconPerson.png"),
              principal: "Agora precisamos de uma foto sua. Pode ser?",
              tamanhoFoto: 6,
              photoPage: 1,
              camera: firstCamera,
            )),
      ),
    );
  }
}
