import 'package:flutter/material.dart';

class LabStaffProfileLoadingIndicatorWidget extends StatelessWidget {
  LabStaffProfileLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}