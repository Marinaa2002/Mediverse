import 'package:flutter/material.dart';

class LabResultLoadingIndicatorWidget extends StatelessWidget {
  LabResultLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}