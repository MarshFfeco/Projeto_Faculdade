import 'package:fadba/Controller/User.dart';
import 'package:fadba/Screens/MainPage/components/AdmCall.dart';
import 'package:fadba/Screens/MainPage/components/Carousel.dart';
import 'package:fadba/Screens/MainPage/components/NavBar.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import '../PerfilScreen/MainPerfilScreen.dart';
import 'components/Article.dart';
import 'components/Blog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.usuario}) : super(key: key);

  final PrimareUser usuario;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final azul = CustomColor().getCorPadraoAzul;

    List<Widget> listaWidget = [
      Carousel(
        usuario: widget.usuario,
      ),
      widget.usuario.runtimeType == Admin
          ? Center(child: AdmCall(height: height, width: width))
          : const SizedBox(),
      const BlogText(),
      Blog(),
    ];
    return Scaffold(
      drawer: NavBar(
        usuario: widget.usuario,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: azul),
        backgroundColor: Colors.white,
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: listaWidget.length,
          itemBuilder: (context, index) => listaWidget[index],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          maisTarde(context, "Menssagem");
        },
        backgroundColor: azul,
      ),
      bottomNavigationBar: BottomNavigation(
        usuario: widget.usuario,
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, required this.usuario}) : super(key: key);

  final PrimareUser usuario;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: IconTheme(
        data: const IconThemeData(color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.all(12.00),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              icon: const Icon(Icons.circle),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PerfilScreen(
                              user: usuario,
                            ))));
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () => maisTarde(context, "Notificação"),
            ),
            IconButton(
              icon: const Icon(Icons.book_outlined),
              onPressed: () => maisTarde(context, "Regras"),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_month_outlined),
              onPressed: () => maisTarde(context, "calendario"),
            ),
            const SizedBox(width: 20)
          ]),
        ),
      ),
    );
  }
}

Future<dynamic> maisTarde(BuildContext context, String titulo) {
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
