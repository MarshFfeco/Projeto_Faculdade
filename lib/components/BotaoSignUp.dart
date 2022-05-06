import 'package:flutter/material.dart';

class BotaoSignUp extends StatefulWidget {
  const BotaoSignUp(
      {Key? key,
      required this.formKey,
      required this.instancia,
      required this.imagem})
      : super(key: key);

  final formKey;
  final dynamic instancia;
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => widget.instancia)));
              }
            }
            if (direction == DismissDirection.endToStart) {
              Navigator.pop(context);
            }
          });
        },
        key: ValueKey(isDrag),
        child: Image.asset(widget.imagem));
  }
}
