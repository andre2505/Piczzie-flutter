import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:piczzie/feature/camera/display_picture_screen.dart';

// A screen that allows users to take a picture using a given camera.
class CameraScreen extends StatefulWidget {
  CameraScreen({Key key}) : super(key: key);

  CameraDescription camera;

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        print("No camera available");
      }
    }).catchError((err) {
      // 3
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(children: [
        Container(child: _cameraPreviewWidget()),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _onCapturePressed(context);
                },
              )
            ]),
      ])),
    );
  }

// 1, 2
  Future _initCameraController(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    // 4
    controller.addListener(() {
      // 5
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    // 6
    try {
      await controller.initialize();
    } on CameraException catch (e) {}

    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    var size = MediaQuery.of(context).size.width;
    if (controller == null || !controller.value.isInitialized) {
      return Center(
          child: const CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
    }

    return Container(child: CameraPreview(controller));
  }

  void _onCapturePressed(context) async {
    var size = MediaQuery.of(context).size.width;
    try {
      // 1
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // 2
      await controller.takePicture(path);
      final File croppedFile = await ImageCropper.cropImage(
          aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
          maxWidth: size.toInt(),
          maxHeight: (size / controller.value.aspectRatio).toInt(),
          cropStyle: CropStyle.rectangle,
          sourcePath: path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          iosUiSettings: IOSUiSettings(
            rotateButtonsHidden: true,
            resetButtonHidden: true,
          ));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DisplayPictureScreen(imagePath: croppedFile.path),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
