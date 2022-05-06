import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DocumentosPage extends StatefulWidget {
  DocumentosPage(
      {Key? key,
      required this.controller,
      required this.initializeControllerFuture})
      : super(key: key);
  //File file;

  final CameraController controller;
  final Future<void> initializeControllerFuture;

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: widget.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("Apertei");
            return CameraPreview(widget.controller);
          } else {
            print("ferrou");
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await widget.initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await widget.controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),

      /*Row(children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () => {
                            Get.back(result: file),
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () => {
                            Get.back(),
                          },
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
        )
      ]),*/
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
