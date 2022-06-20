import 'package:flutter/material.dart';

import '../values/Custom_color.dart';

class CampoEscolha extends StatefulWidget {
  CampoEscolha(
      {Key? key,
      required this.dropOpcoes,
      this.onSaved,
      required this.dropValue})
      : super(key: key);

  List dropOpcoes = [];
  String dropValue;
  final void Function(String? text)? onSaved;

  @override
  State<CampoEscolha> createState() => _CampoEscolhaState();
}

class _CampoEscolhaState extends State<CampoEscolha> {
  // String dropValue = "Faculdade";
  @override
  Widget build(BuildContext context) {
    //List dropOpcoes = ["Faculdade", "Escola"];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                CustomColor().getCorPadraoAzul.withOpacity(0.15),
                Colors.black
              ])),
      child: DropdownButtonFormField(
        onSaved: widget.onSaved,
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        dropdownColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        value: widget.dropValue,
        onChanged: (String? newValue) {
          setState(
            () {
              widget.dropValue = newValue!;
            },
          );
        },
        items: widget.dropOpcoes.map((valueItem) {
          return DropdownMenuItem<String>(
            value: valueItem,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                valueItem,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
