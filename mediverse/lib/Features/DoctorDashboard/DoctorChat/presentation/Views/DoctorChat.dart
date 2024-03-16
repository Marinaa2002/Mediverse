// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AppBarRowChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/NameIconChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/PopUpMenu.dart';

class DoctorChat extends StatelessWidget {
  DoctorChat({super.key});

  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //refactor do not need to rebuild all screen

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const AppBarRowIconChat(),
        ),
        title: const NameIconChat(),
        actions: const [
          PopUpWindow(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChatCoumn(
            controller2: _controller,
            textEditingcontroller: controller,
            messages: messages),
      ),
    );
  }
}
