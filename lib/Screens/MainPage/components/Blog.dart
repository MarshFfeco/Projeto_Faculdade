import 'package:flutter/material.dart';

import '../../../Controller/User.dart';
import 'Article.dart';

class Blog extends StatefulWidget {
  Blog({Key? key, required this.usuario, required this.listaArticle})
      : super(key: key);

  admin usuario;
  List<Widget> listaArticle;

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      //height: height,
      child: Column(children: widget.listaArticle),
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
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: width * 0.95,
        child: const Text(
          "Blog",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
