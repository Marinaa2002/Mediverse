import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constants.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/ChatMessage.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Text('12/5/2022', style: Themes.DateText),
                  ),
                  ChatMessage(
                      message:
                          'hello this is the doctor talking how are you sdjflksdjflksddflsjdflsdlfkj sljskdjflksdf sdflksdjf',
                      isMe: true),
                  ChatMessage(
                      message: 'Hi doctor i am fine thank you', isMe: false),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 211, 189, 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Send Message',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
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
                        alignment: AlignmentDirectional(1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
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
  }
}
