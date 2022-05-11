import 'dart:io';
import 'package:camera/camera.dart';
import 'package:fadba/Screens/SignUp/LastPageSignUp.dart';
import 'package:fadba/Screens/SignUp/PhotoScreen.dart';
import 'package:flutter/material.dart';

class DocumentosPage extends StatefulWidget {
  const DocumentosPage(
      {Key? key,
      required this.controller,
      required this.initializeControllerFuture,
      required this.photoPage,
      required this.camera})
      : super(key: key);

  final CameraController controller;
  final Future<void> initializeControllerFuture;
  final int photoPage;
  final List<CameraDescription> camera;

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  bool isFrontal = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<void>(
        future: widget.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
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
    return Scaffold(
      body: Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 32,
                child: IconButton(
                  onPressed: () {
                    if (photoPage == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LastPageSignUp(),
                        ),
                      );
                    } else {
                      chamada(context, photoPage);
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                ),
              ),
              CircleAvatar(
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
              )
            ],
          ),
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
            camera: cameras,
            isFrontal: false,
          );
        } else if (photoPage == 2) {
          return PhotoScreen(
            explicacao:
                "Clique no icone acima e tire uma foto do seu documento",
            mainPhoto: Image.asset("assets/img/iconDocument.png"),
            principal: "Agora precisamos de uma foto do seu CPF. Pode ser?",
            tamanhoFoto: 4,
            photoPage: 3,
            camera: cameras,
            isFrontal: false,
          );
        }

        return Container();
      }),
    );
  }
}
