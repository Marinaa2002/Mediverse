import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/GlobalWidgets/BeginWidget.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: BeginWidget(
        widget: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/logo2.png',
                  width: size.width,
                  height: size.height*0.5,
                  fit: BoxFit.contain,
                  alignment: const Alignment(0, 0),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB
                  (0, size.height * 0.0516, 0, 0),
                child: Text('Welcome to MediVerse!',
                    style: Themes.splashBoldTitle),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  size.width * 0.112,
                  size.height * 0.009,
                  size.width * 0.112,
                  0,
                ),
                child: Text(
                  'Better Health = Better Universe',
                  textAlign: TextAlign.center,
                  style: Themes.labelColored,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}