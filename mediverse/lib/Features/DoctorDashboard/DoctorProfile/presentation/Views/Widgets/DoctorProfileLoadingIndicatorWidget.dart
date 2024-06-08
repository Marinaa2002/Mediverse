import 'package:flutter/material.dart';

class DoctorProfileLoadingIndicatorWidget extends StatelessWidget {
  DoctorProfileLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}