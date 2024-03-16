import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/UploadScreenPhoto.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AllAboutTextFieldAndIconsSendAndCamera.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/CameraIconButton.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChattingTextFieldAndIcon.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/DateChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/MessagesListView.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/SendButtonWithAlign.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/TextFieldForMsgs.dart';

import 'SendButtonIcon.dart';

String textData = "";

class ChatCoumn extends StatelessWidget {
  const ChatCoumn({
    super.key,
    required ScrollController controller2,
    required this.textEditingcontroller,
    required this.messages,
  }) : _scrollablecontroller = controller2;

  final ScrollController _scrollablecontroller;
  final TextEditingController textEditingcontroller;
  final CollectionReference<Object?> messages;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DateOfChat(),
              MessagesListView(
                messagesList: messagesList,
                controller: _scrollablecontroller,
              ),
              AllAboutTextFieldAndIconsSendAndCamera(
                textEditingcontroller: textEditingcontroller,
                messages: messages,
                scrollablecontroller: _scrollablecontroller,
                onPressedCameraIcon: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadPhotoScreen()),
                  );
                },
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return const Center(
          child: Text("No chats in Here"),
        );
      },
    );
  }
}
