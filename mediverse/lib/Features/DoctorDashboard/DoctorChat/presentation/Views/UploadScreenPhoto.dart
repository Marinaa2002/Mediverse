import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AllAboutTextFieldAndIconsSendAndCamera.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChattingTextFieldAndIcon.dart';

void main() {
  runApp(MyApp());
}

String InWhichScreen = "ChatPage";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadPhotoScreen(),
    );
  }
}

class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  List<File> _images = [];

  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  TextEditingController controller = TextEditingController();
  bool _showPlusIcon = true;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Photos'),
        backgroundColor: kprimaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                _images.isNotEmpty
                    ? Image.file(
                        _images.last,
                        fit: BoxFit
                            .contain, // Fit the image within the container
                      )
                    : const Placeholder(), // Placeholder for the mock image
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AllAboutTextFieldAndIconsSendAndCamera(
                        textEditingcontroller: controller,
                        messages: messages,
                        scrollablecontroller: _controller,
                        onPressedCameraIcon: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const CameraScreen()),
                          // );
                        },
                        patient_id: '',
                        doctor_id: '',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
