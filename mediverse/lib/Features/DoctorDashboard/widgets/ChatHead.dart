import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

import '../DoctorChat/presentation/Views/DoctorChat.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(2, 8, 2, 0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: kSecondryBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0,
              color: Color(0xFFE0E3E7),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Randy Rudolph',
                        style: Themes.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Hello, Can you please check my la...',
                        style: Themes.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFF1F4F8),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(0xFF57636C),
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const DoctorChat()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
