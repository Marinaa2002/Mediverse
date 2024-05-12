import 'package:flutter/material.dart';

class AdminProfileLoadingIndicatorWidget extends StatelessWidget {
  AdminProfileLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}