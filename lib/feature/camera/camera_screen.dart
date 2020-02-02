import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:piczzie/feature/camera/display_picture_screen.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'package:piczzie/service/service_locator.dart';
import 'package:torch/torch.dart';

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
  Color flashActivated;

  @override
  void initState() {
    super.initState();
    flashActivated = Colors.white;
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
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  locator<NavigationService>().pop();
                },
              )
            ]),
        Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(40),
                  color: Colors.transparent,
                  child: RaisedButton(
                    elevation: 0,
                    highlightElevation: 0,
                    highlightColor: Colors.yellowAccent,
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {
                      _onCapturePressed(context);
                    },
                  ),
                )) //Your widget here,
            ),
        Align(
            alignment: FractionalOffset.bottomRight,
            child: Padding(
                padding: EdgeInsets.only(bottom: 40, right: 60),
                child: Container(
                    width: 40,
                    child: FloatingActionButton(
                      elevation: 0,
                      highlightElevation: 0,
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.flash_on, color: flashActivated),
                      shape: CircleBorder(
                          side: BorderSide(color: flashActivated, width: 1.0)),
                      onPressed: () {
                        setState(() {
                          if (flashActivated == Colors.white) {
                            Torch.turnOn();
                            flashActivated = Colors.yellowAccent;
                          } else {
                            Torch.turnOff();
                            flashActivated = Colors.white;
                          }
                        });
                      },
                    ))))
      ])),
    );
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });
    try {
      await controller.initialize();
    } on CameraException catch (e) {}

    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
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

      await controller.takePicture(path);

      if(flashActivated == Colors.yellowAccent) {
        setState(() {
          flashActivated = Colors.white;
          Torch.turnOff();
        });
      }

      await ImageCropper.cropImage(
              aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
              maxWidth: size.toInt(),
              maxHeight: size ~/ controller.value.aspectRatio,
              cropStyle: CropStyle.rectangle,
              sourcePath: path,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
              ],
              androidUiSettings: AndroidUiSettings(
                lockAspectRatio: true,
                activeControlsWidgetColor: Colors.grey,
                hideBottomControls: true,
                toolbarColor: Colors.black,
                statusBarColor: Colors.black,
                toolbarWidgetColor: Colors.white,
                toolbarTitle: ""
              ),
              iosUiSettings: IOSUiSettings(
                  rotateButtonsHidden: true,
                  resetButtonHidden: true,
                  aspectRatioLockEnabled: true))
          .then((value) {
        if (value != null) {
          return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: value.path)),
          );
        }
        return null;
      });
    } catch (e) {
      print(e);
    }
  }
}
