// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatMessage.dart';

class DoctorChat extends StatelessWidget {
  DoctorChat({super.key});

  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  TextEditingController controller = TextEditingController();
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

          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: kprimaryColor,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Ahmed Hassan',
                style: Themes.headlineMedium.copyWith(
                  color: backgroundColor,
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2,
            ),
            body: messagesList.isEmpty
                ? const Center(
                    child: Text("No Chat"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('12/5/2022', style: Themes.DateText),
                        ),
                        Expanded(
                          child: ListView.builder(
                              reverse: true,
                              controller: _controller,
                              itemCount: messagesList.length,
                              itemBuilder: (context, index) {
                                if (messagesList[index].id == "A") {
                                  return ChatMessage(
                                    message: messagesList[index],
                                    isMe: true,
                                  );
                                } else {
                                  return ChatMessage(
                                    message: messagesList[index],
                                    isMe: false,
                                  );
                                }
                              }),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 4),
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
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8, 0, 8, 0),
                                      child: TextField(
                                        controller: controller,
                                        onSubmitted: (data) {
                                          messages.add(
                                            {
                                              kMessage: data,
                                              kCreatedAt: DateTime.now(),
                                              'id': "A"
                                            },
                                          );
                                          controller.clear();
                                          _controller.animateTo(0,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeIn);
                                        },
                                        // don't forget controller
                                        decoration: const InputDecoration(
                                          hintText: 'Send Message',
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 8, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
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
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.send,
                                          color: kSecondaryTextColor,
                                          size: 24,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
