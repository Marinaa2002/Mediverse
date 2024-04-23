import 'package:flutter/material.dart';

class ProfileLoadingIndicatorWidget extends StatelessWidget {
  ProfileLoadingIndicatorWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}