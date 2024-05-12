// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';

//Sending Takes time fa lazm al network speed taba kabira
//w kaman a3mlha compress w anfo5 al quality
class CameraViewPage extends StatelessWidget {
  CameraViewPage(
      {key,
      required this.path,
      required this.fileName,
      required this.imageFile,
      this.doctor_id,
      this.patient_id})
      : super(key: key);
  final String path;
  final String fileName;
  final XFile imageFile;
  String? patient_id = '';
  String? doctor_id = '';

  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  CollectionReference chatHistory =
      FirebaseFirestore.instance.collection('ChatHistory');
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
                          String nowRole = "";
                          if (patient_id == globalcurrentUserId) {
                            nowRole = "Patient";
                          } else {
                            nowRole = "Doctor";
                          }
                          //nrkz
                          messages.add(
                            {
                              kMessage: textData,
                              kCreatedAt: DateTime.now(),
                              'patient_id': patient_id,
                              'doctor_id': doctor_id,
                              'imageUrl': downloadUrl,
                              'Sender': nowRole
                            },
                          );
                          QuerySnapshot querySnapshot = await FirebaseFirestore
                              .instance
                              .collection('ChatHistory')
                              .where('doctor_id', isEqualTo: doctor_id)
                              .where('patient_id', isEqualTo: patient_id)
                              .get();

                          if (querySnapshot.docs.isEmpty) {
                            // Document with specified fields exists
                            chatHistory.add(
                              {
                                'patient_id': patient_id,
                                'doctor_id': doctor_id,
                              },
                            );
                            log('Document do not exist!');
                          }
                          controller.clear();

                          textData = "";
                          Navigator.of(context).popUntil(
                              (route) => route.settings.name == '/DoctorChat');
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
