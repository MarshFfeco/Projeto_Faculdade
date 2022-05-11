import 'package:fadba/Screens/FirstScreen/FirstScreen.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Meu nome"),
            accountEmail: const Text("adm@adm.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "http://s2.glbimg.com/kmbgBzKPL0URISIQenPiAKo4ORI=/e.glbimg.com/og/ed/f/original/2017/08/23/5c147f01-dff6-4952-98a0-9394c88361c2.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                    ("assets/img/BackGround_drawer.jpg"),
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.headphones,
              color: CustomColor().getCorPadraoAzul,
            ),
            title: const Text("Em Breve"),
            onTap: null,
          ),
          Divider(
            color: CustomColor().getCorPadraoAzul,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: CustomColor().getCorPadraoAzul,
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
}
