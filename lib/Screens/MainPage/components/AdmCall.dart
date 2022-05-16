import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

class AdmCall extends StatelessWidget {
  const AdmCall({Key? key, required this.height, required this.width})
      : super(key: key);

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      width: width * 0.95,
      height: height * 0.13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
          ]),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "Chamada",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Flexible(
                  child: IconCall(
                    iconCall: Icons.book,
                    name: "Estudo",
                    cor: CustomColor().getCorPadraoAzul,
                    funcao: () {
                      maisTardeAdmCall(context, "Estudo");
                    },
                  ),
                ),
                Flexible(
                  child: IconCall(
                    iconCall: Icons.church,
                    name: "Capela",
                    cor: CustomColor().getCorPadraoAzul,
                    funcao: () {
                      maisTardeAdmCall(context, "Capela");
                    },
                  ),
                ),
                Flexible(
                  child: IconCall(
                    iconCall: Icons.bed,
                    name: "Quarto",
                    cor: CustomColor().getCorPadraoAzul,
                    funcao: () {
                      maisTardeAdmCall(context, "Estudo");
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> maisTardeAdmCall(BuildContext context, String titulo) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: const Text("Em desenvolvimento"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("Ok"))
        ],
      ),
    );
  }
}

class IconCall extends StatelessWidget {
  IconCall(
      {Key? key,
      required this.iconCall,
      required this.name,
      required this.cor,
      required this.funcao})
      : super(key: key);

  IconData iconCall;
  String name;
  Color cor;
  final VoidCallback funcao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            color: cor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: funcao,
                  icon: Icon(iconCall),
                  color: Colors.black,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
