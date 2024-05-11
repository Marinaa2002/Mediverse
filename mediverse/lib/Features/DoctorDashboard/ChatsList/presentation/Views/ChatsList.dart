import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatHead.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: kprimaryColor,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.chevron_left,
      //       color: Colors.white,
      //       size: 24,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   title: Text(
      //     'Chats',
      //     style: Themes.headlineMedium.copyWith(
      //       color: backgroundColor,
      //     ),
      //   ),
      //   actions: const [],
      //   centerTitle: true,
      //   elevation: 2,
      // ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: const [
                    ChatHead(),
                    ChatHead(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
