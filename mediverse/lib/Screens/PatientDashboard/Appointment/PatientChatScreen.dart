import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/PatientDashboard/Widgets/CustomMyMessageWidget.dart';
import 'package:mediverse/Screens/PatientDashboard/Widgets/CustomNotMyMessageWidget.dart';

class PatientChatScreen extends StatelessWidget {
  PatientChatScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text(
            'Dr. Ashraf Hassan',
            style: Themes.headlineMedium.copyWith(
              color: backgroundColor,
            ),
        ),
        actions: const [],
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
                  CustomMyMessageWidget(
                      height: 45, width: 100, message: 'Hello Doctor'),
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
                  CustomMyMessageWidget(
                      height: 45, width: 100, message: 'Thank you'),
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
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
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
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
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
