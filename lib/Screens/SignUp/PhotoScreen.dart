import 'dart:async';
import 'package:camera/camera.dart';
import 'package:fadba/Screens/SignUp/LastPageSignUp.dart';
import 'package:flutter/material.dart';
import '../../values/Custom_color.dart';
import 'DocumentosPage.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen(
      {Key? key,
      required this.explicacao,
      required this.mainPhoto,
      required this.principal,
      required this.tamanhoFoto,
      required this.photoPage,
      required this.camera,
      this.isFrontal = false})
      : super(key: key);

  final List<CameraDescription> camera;

  final Image mainPhoto;
  final String principal;
  final String explicacao;
  final int tamanhoFoto;
  final int photoPage;
  final bool isFrontal;

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
        widget.camera[widget.isFrontal ? 1 : 0], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: const Alignment(0.0, 1.6),
                radius: 1.0,
                colors: [CustomColor().getCorPadraoAzul, Colors.black])),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Flexible(flex: widget.tamanhoFoto, child: widget.mainPhoto),
            Flexible(
              flex: 2,
              child: SizedBox(
                  width: width, child: paginasPhoto(widget.photoPage, context)),
            ),
            const Spacer(flex: 3),
            Flexible(
                flex: 2,
                child: SizedBox(
                  width: width * 0.6,
                  child: Text(
                    widget.principal,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            const Spacer(flex: 1),
            Flexible(
              flex: 2,
              child: SizedBox(
                width: width * 0.7,
                child: Text(
                  widget.explicacao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  paginasPhoto(int photoPage, BuildContext context) {
    switch (photoPage) {
      case 1:
        return GestureDetector(
            child: Image.asset("assets/img/IconCamera.png"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    camera: widget.camera,
                    photoPage: photoPage,
                    controller: _controller,
                    initializeControllerFuture: _initializeControllerFuture,
                  ),
                ),
              );
            });

      case 2:
        return GestureDetector(
            child: Image.asset("assets/img/IconCamera.png"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    camera: widget.camera,
                    photoPage: photoPage,
                    controller: _controller,
                    initializeControllerFuture: _initializeControllerFuture,
                  ),
                ),
              );
            });
      case 3:
        return GestureDetector(
            child: Image.asset("assets/img/IconCamera.png"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    camera: widget.camera,
                    photoPage: photoPage,
                    controller: _controller,
                    initializeControllerFuture: _initializeControllerFuture,
                  ),
                ),
              );
            });
      default:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LastPageSignUp(),
          ),
        );
    }
  }
}
