import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/UploadScreenPhoto.dart';

class CameraIconButtonForUploadScreen extends StatelessWidget {
  const CameraIconButtonForUploadScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
      child: IconButton(
        icon: const Icon(
          Icons.camera_alt,
          color: kSecondaryTextColor,
          size: 24,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadPhotoScreen()),
          );
        },
      ),
    );
  }
}
