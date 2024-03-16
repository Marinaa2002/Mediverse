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
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
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
                  messagesList: messagesList,
                  controller2: _controller,
                  textEditingcontroller: controller,
                  messages: messages),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return const Center();
      },
    );
  }
}
