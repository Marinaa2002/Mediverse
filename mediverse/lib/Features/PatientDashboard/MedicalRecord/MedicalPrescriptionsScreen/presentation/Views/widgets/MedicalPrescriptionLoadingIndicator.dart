import 'package:flutter/material.dart';

class MedicalPrescriptionLoadingIndicatorWidget extends StatelessWidget {
  MedicalPrescriptionLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}