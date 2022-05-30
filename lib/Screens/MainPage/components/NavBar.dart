import 'package:fadba/Screens/AdmScreen/AdmScreen.dart';
import 'package:fadba/Screens/FirstScreen/FirstScreen.dart';
import 'package:fadba/Screens/PerfilScreen/MainPerfilScreen.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import '../../../Controller/User.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.usuario}) : super(key: key);

  final PrimareUser usuario;

  @override
  Widget build(BuildContext context) {
    final azul = CustomColor().getCorPadraoAzul;
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Anderson Borba"),
            accountEmail: Text("GTI 5ª"),
            currentAccountPicture: MyAvatar(
              width: 90,
              height: 90,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                    ("assets/img/BackGround_drawer.jpg"),
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          usuario.runtimeType == Admin
              ? ListTile(
                  leading: Icon(
                    Icons.admin_panel_settings,
                    color: azul,
                  ),
                  title: const Text("Administração"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdmScreen()));
                  },
                )
              : const SizedBox(),
          usuario.runtimeType == Admin
              ? Divider(
                  color: azul,
                )
              : const SizedBox(),
          ListTile(
            leading: Icon(Icons.person, color: azul),
            title: const Text("Perfil"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => PerfilScreen(
                            user: usuario,
                          ))));
            },
          ),
          ListTile(
            leading: Icon(Icons.circle_notifications, color: azul),
            title: const Text("Notificação"),
            onTap: () {
              maisTarde(context, "Notificação");
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month, color: azul),
            title: const Text("Calendário"),
            onTap: () {
              maisTarde(context, "Calendario");
            },
          ),
          Divider(
            color: azul,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: azul,
            ),
            title: const Text("Sair"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Sair"),
                  content: const Text("Tem certeza?"),
                  actions: [
                    TextButton(
                      child: const Text("Não"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("Sim"),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const FirstScreen()),
                            (Route<dynamic> route) => false);
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
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
}

class MyAvatar extends StatelessWidget {
  const MyAvatar({Key? key, required this.height, required this.width})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: ClipOval(
        child: Image.network(
          "http://s2.glbimg.com/kmbgBzKPL0URISIQenPiAKo4ORI=/e.glbimg.com/og/ed/f/original/2017/08/23/5c147f01-dff6-4952-98a0-9394c88361c2.jpg",
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
