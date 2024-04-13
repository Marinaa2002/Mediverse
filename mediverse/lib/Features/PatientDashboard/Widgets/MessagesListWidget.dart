import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import 'CustomMyMessageWidget.dart';
import 'CustomNotMyMessageWidget.dart';

class MessagesListWidget extends StatelessWidget {
  const MessagesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return ListView(
      children: [
        Center(
          child: Text('12/5/2022', style: Themes.DateText),
        ),
        CustomMyMessageWidget(height: 45, width: 100, message: 'Hello Doctor'),
        CustomNotMyMessageWidget(
          message: 'Hello',
          width: 80,
          height: 45,
        ),
        CustomMyMessageWidget(
          width: 250,
          height: 60,
          message:
              'I will send lab results, Can you see it and tell me how is it?',
        ),
        Align(
          alignment: AlignmentDirectional(1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
            child: Material(
              color: Colors.transparent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                width: 150,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/GNU_Health_lab_report_sample.png',
                      width: 300,
                      height: 170,
                      fit: BoxFit.fill,
                      alignment: Alignment(0, 0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CustomNotMyMessageWidget(
          message: 'Okay, I will see it',
          width: 150,
          height: 50,
        ),
        CustomNotMyMessageWidget(
          message: 'You have to visit me in my clinic',
          width: 240,
          height: 50,
        ),
        CustomMyMessageWidget(
            height: 50,
            width: 260,
            message: 'Okay, I will book and visit you ASAP'),
        CustomMyMessageWidget(height: 45, width: 100, message: 'Thank you'),
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
            child: Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 157, 108, 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'You are welcome',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
