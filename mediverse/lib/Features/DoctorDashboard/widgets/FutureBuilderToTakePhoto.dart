import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FutureBuilderToTakePhoto extends StatelessWidget {
  const FutureBuilderToTakePhoto({
    super.key,
    required this.cameraValue,
    required CameraController? cameraController,
  }) : _cameraController = cameraController;

  final Future<void>? cameraValue;
  final CameraController? _cameraController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        });
  }
}
