import 'package:fadba/Controller/User.dart';
import 'package:fadba/Screens/MainPage/components/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../values/Custom_color.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key, required this.user}) : super(key: key);

  final PrimareUser user;

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final azul = CustomColor().getCorPadraoAzul;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: widget.user.runtimeType == Admin
            ? [IconButton(onPressed: null, icon: Icon(Icons.qr_code))]
            : [],
        elevation: 0,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios),
          color: azul,
        ),
      ),
      body: Column(
        children: [
          MyInformation(
            height: height,
            width: width,
            user: widget.user,
          ),
          Divider(color: azul, thickness: 1.0),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyInformation extends StatefulWidget {
  const MyInformation(
      {Key? key, required this.height, required this.width, required this.user})
      : super(key: key);

  final double height;
  final double width;
  final PrimareUser user;

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  String tick = "";

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() {
      tick = code != '-1' ? code : "Não avaliado";
    });
  }

  @override
  Widget build(BuildContext context) {
    final double limite = widget.user.runtimeType == Admin ? 0.40 : 0.35;

    String sticker = '';

    return SizedBox(
      height: widget.height * limite,
      width: widget.width,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: 150,
              height: 150,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "http://s2.glbimg.com/kmbgBzKPL0URISIQenPiAKo4ORI=/e.glbimg.com/og/ed/f/original/2017/08/23/5c147f01-dff6-4952-98a0-9394c88361c2.jpg",
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Anderson Borba",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.person,
                    size: 15,
                    color: CustomColor().getCorPadraoAzul,
                  )
                ],
              ),
            ),
          ),
          widget.user.runtimeType == Admin
              ? Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Administrador",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.shield,
                          size: 15,
                          color: CustomColor().getCorPadraoAzul,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          const Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "(00) 0 0000-0000",
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
          widget.user.runtimeType == Admin
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        readQRCode();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: CustomColor().getCorPadraoAzul,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Escanear QR Code",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                )
              : const SizedBox(),
          Expanded(child: Text(tick)),
        ],
      ),
    );
  }
}
