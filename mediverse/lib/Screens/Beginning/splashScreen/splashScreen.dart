import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/conts/Themes.dart';
import '../../../Widgets/BeginWidget.dart';
import '../../../conts/consts.dart';
import '../LoginScreen/LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      BeginWidget(widget: Align(
        alignment: AlignmentDirectional(0, 0),
        child:Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/logo2.png',
                width: 420,
                height: 406,
                fit: BoxFit.contain,
                alignment: Alignment(0, 0),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
              child: Text(
                  'Welcome to MediVerse!',
                  style: Themes.splashBoldTitle
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
              child: Text(
                'Better Health = Better Universe',
                textAlign: TextAlign.center,
                style: Themes.labelColored,
              ),),
          ],),
      ),),
    );
  }
}


