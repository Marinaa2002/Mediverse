import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/GlobalWidgets/BeginWidget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust duration as needed
    );

    _animation = Tween<Offset>(
      begin: Offset(0, -1), // Start position (above the screen)
      end: Offset(0, 0), // End position (center of the screen)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation when the widget is initialized
    _controller.forward();

    // Navigate to LoginScreen after the animation finishes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed(
          '/login',
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeginWidget(
        widget: SlideTransition(
          position: _animation,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to MediVerse!',
                  style: Themes.splashBoldTitle,
                ),
                SizedBox(height: 8),
                Text(
                  'Better Health = Better Universe',
                  textAlign: TextAlign.center,
                  style: Themes.labelColored,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
