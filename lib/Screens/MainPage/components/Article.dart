import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({
    Key? key,
    required this.titulo,
    required this.conteudo,
    required this.imagem,
  }) : super(key: key);

  final String titulo;
  final String conteudo;
  final Image imagem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        maisTardeArticle(context);
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
            ],
          ),
          height: 260,
          width: width * 0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: 260, maxWidth: width * 0.45),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: imagem,
                ),
              ),
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: 220, maxWidth: width * 0.45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        titulo,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      conteudo,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Align(
                        alignment: Alignment.bottomRight,
                        child: Text("13/05/2022")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> maisTardeArticle(BuildContext context) {
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
