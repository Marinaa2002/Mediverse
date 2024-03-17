import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/DoctorChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';

class CameraViewPage extends StatelessWidget {
  CameraViewPage(
      {key,
      required this.path,
      required this.fileName,
      required this.imageFile})
      : super(key: key);
  final String path;
  final String fileName;
  final XFile imageFile;
  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 160,
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextField(
                  onChanged: (value) {
                    textData = value;
                  },
                  controller: controller,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add Caption....",
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    suffixIcon: CircleAvatar(
                      radius: 27,
                      backgroundColor: kprimaryColor,
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        color: Colors.white,
                        iconSize: 27,
                        onPressed: () async {
                          String filePath = imageFile.path;
                          Reference storageReference = FirebaseStorage.instance
                              .ref()
                              .child('photos')
                              .child(fileName);
                          UploadTask uploadTask = storageReference
                              .putFile(File(filePath)); // Convert XFile to File
                          TaskSnapshot storageTaskSnapshot =
                              await uploadTask.whenComplete(() => null);

                          // Get download URL from Firebase Storage
                          String downloadUrl =
                              await storageTaskSnapshot.ref.getDownloadURL();
                          messages.add(
                            {
                              kMessage: textData,
                              kCreatedAt: DateTime.now(),
                              'id': "B",
                              'imageUrl': downloadUrl
                            },
                          );
                          controller.clear();

                          textData = "";
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
