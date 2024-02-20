import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

import '../Widgets/CustomAdviceWidget.dart';
import '../Widgets/CustomDateWidget.dart';

class DrNotesScreen extends StatelessWidget {
  DrNotesScreen({super.key});

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
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
            'My Medical Notes',
            style: TextStyle(fontFamily: 'Outfit', color: Colors.white,
              fontSize: 20,)
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
                  CustomDateWidget(date: '8/8/2023'),
                  CustomAdviceWidget(advice: ' Don\'t eat fatty foods for you cholestrol'),
                  CustomDateWidget(date: '15/9/2023'),
                  CustomAdviceWidget(advice: ' Drink about 2 litres of water per day'),
                  CustomDateWidget(date: '20/9/2023'),
                  CustomAdviceWidget(advice: 'Make sure to eat well before taking your medication'),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    //Color.fromRGBO(255, 192, 203, 3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Send Advice',
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 8, 0),
                            ),
                            style: TextStyle( color: Colors.white,
                              fontSize: 12,),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 24,
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
