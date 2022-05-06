import 'dart:io';
import 'package:camera/camera.dart';
import 'package:fadba/Screens/SignUp/PhotoScreen.dart';
import 'package:flutter/material.dart';

import '../MainPage/MainPage.dart';

class DocumentosPage extends StatefulWidget {
  DocumentosPage(
      {Key? key,
      required this.controller,
      required this.initializeControllerFuture,
      required this.photoPage})
      : super(key: key);

  final CameraController controller;
  final Future<void> initializeControllerFuture;
  final int photoPage;

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<void>(
        future: widget.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("Abrir Camera");
            return Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: CameraPreview(widget.controller),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: width,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () async {
                            try {
                              await widget.initializeControllerFuture;

                              final image =
                                  await widget.controller.takePicture();

                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DisplayPictureScreen(
                                    imagePath: image.path,
                                    photoPage: widget.photoPage,
                                  ),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          icon: Image.asset("assets/img/butonCapture.png"),
                          iconSize: 70,
                        ),
                        IconButton(
                          iconSize: 40,
                          onPressed: () {},
                          icon: Icon(Icons.camera_front),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            print("ferrou");
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final int photoPage;

  const DisplayPictureScreen(
      {Key? key, required this.imagePath, required this.photoPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            SizedBox(
              child: Center(child: Image.file(File(imagePath))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        onPressed: () => {
                          if (photoPage == 3)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ),
                              ),
                            }
                          else
                            {chamada(context, photoPage)}
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.greenAccent,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.black,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),

      //Image.file(File(imagePath)),
    );
  }

  Future<void> chamada(BuildContext context, int photoPage) async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        if (photoPage == 1) {
          return PhotoScreen(
            explicacao:
                "Clique no icone acima e tire uma foto da frente e outra do verso do seu documento",
            mainPhoto: Image.asset("assets/img/iconDocument.png"),
            principal: "Agora precisamos de uma foto do seu RG. Pode ser?",
            tamanhoFoto: 4,
            photoPage: 2,
            camera: firstCamera,
          );
        } else if (photoPage == 2) {
          return PhotoScreen(
            explicacao:
                "Clique no icone acima e tire uma foto do seu documento",
            mainPhoto: Image.asset("assets/img/iconDocument.png"),
            principal: "Agora precisamos de uma foto do seu CPF. Pode ser?",
            tamanhoFoto: 4,
            photoPage: 3,
            camera: firstCamera,
          );
        }

        return Container();
        /*PhotoScreen(
          explicacao: "Clique no icone acima e tire uma foto do seu documento",
          mainPhoto: Image.asset("assets/img/iconDocument.png"),
          principal: "Agora precisamos de uma foto do seu CPF. Pode ser?",
          tamanhoFoto: 4,
          photoPage: 3,
          camera: firstCamera,
        );*/
      }),
    );
  }
}
