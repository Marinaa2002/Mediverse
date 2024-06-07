import 'package:flutter/material.dart';

class StaffProfileLoadingIndicatorWidget extends StatelessWidget {
  StaffProfileLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}