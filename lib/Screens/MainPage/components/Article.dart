import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  List<Widget> adds = [
    BlogText(),
    Article(
      titulo: "Gatinhos",
      conteudo: "Os gatos são incríveis!",
      imagem: Image.network(
        "https://i.pinimg.com/236x/b2/30/c1/b230c1e8cd503dff0a2f087daf499331--balinese-cat-siamese-kittens.jpg",
        fit: BoxFit.fitHeight,
      ),
    ),
    Article(
      titulo: "Computadores",
      conteudo: "Os computadores da Nasa",
      imagem: Image.network(
        "https://www.oficinadanet.com.br/imagens/post/24224/capa.jpg",
        fit: BoxFit.fitHeight,
      ),
    ),
    Article(
      titulo: "Animes",
      conteudo: "Recomendações de animes bons!",
      imagem: Image.asset(
        "assets/Post/Post_anime.jpg",
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.red),
      margin: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
          itemCount: adds.length, itemBuilder: (context, index) => adds[index]),
    );
  }
}

class BlogText extends StatelessWidget {
  const BlogText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: width * 0.95,
        child: const Text(
          "Blog",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

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
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
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
              child: Container(
                //decoration: BoxDecoration(color: Colors.greenAccent),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
