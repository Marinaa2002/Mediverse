import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/CameraViewPage.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameraValue;
  // bool isRecoring = false;
  // bool flash = false;
  bool iscamerafront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController?.initialize();
    _cameraController?.setFlashMode(FlashMode.off);
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }

//kont 3ayez a3mlha bloc and cubit bs al fakra fe eh an al chat lazm yab2a live w da mat7a2sh
//b al cubit w flutter 3ashan hia bt3ml call mara wa7da bs
//kont lazam a3ml set state w call liha tab leh over engineering
// tab al hna fe upload al stateful widget msh sharira bs al fakra manzodsh mn3mlsh setstate 3al fadi
// y3ni ana fakrt a3ml setstate bs hatr a3ml rebuild l ui kolo bardo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController!));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () async {
                            await _getImage(context);
                          }),
                      GestureDetector(
                        onTap: () {
                          takePhoto(context);
                        },
                        child: const Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                          icon: Transform.rotate(
                            angle: transform,
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              iscamerafront = !iscamerafront;
                              transform = transform + pi;
                            });
                            int cameraPos = iscamerafront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras![cameraPos], ResolutionPreset.high);
                            cameraValue = _cameraController?.initialize();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile? file = await _cameraController?.takePicture();
    String fileName =
        file!.path.split('/').last; // Get the filename from the path
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraViewPage(
          path: file!.path,
          fileName: fileName,
        ),
      ),
    );
  }

  Future<void> _getImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    String fileName = pickedFile!.path.split('/').last;

    setState(() {});

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: pickedFile!.path,
                  fileName: fileName,
                )));
  }
}
