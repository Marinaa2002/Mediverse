import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage({key, required this.path, required this.fileName})
      : super(key: key);
  final String path;
  final String fileName;

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
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        backgroundColor: kprimaryColor,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 27,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
