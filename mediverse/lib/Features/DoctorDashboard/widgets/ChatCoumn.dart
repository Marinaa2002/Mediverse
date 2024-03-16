import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/DateChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/MessagesListView.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/TextFieldForMsgs.dart';

String textData = "";

class ChatCoumn extends StatelessWidget {
  const ChatCoumn({
    super.key,
    required this.messagesList,
    required ScrollController controller2,
    required this.textEditingcontroller,
    required this.messages,
  }) : _scrollablecontroller = controller2;

  final List<Message> messagesList;
  final ScrollController _scrollablecontroller;
  final TextEditingController textEditingcontroller;
  final CollectionReference<Object?> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DateOfChat(),
        MessagesListView(
          messagesList: messagesList,
          controller: _scrollablecontroller,
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 211, 189, 2),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFieldForMsgs(
                      controller: textEditingcontroller,
                      messages: messages,
                      controller2: _scrollablecontroller),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: kSecondaryTextColor,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: kSecondaryTextColor,
                          size: 24,
                        ),
                        onPressed: () {
                          messages.add(
                            {
                              kMessage: textData,
                              kCreatedAt: DateTime.now(),
                              'id': "B"
                            },
                          );
                          textEditingcontroller.clear();
                          _scrollablecontroller.animateTo(10,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          textData = "";
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
