import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Views/CameraScreen.dart';

class CameraIconButton extends StatelessWidget {
  const CameraIconButton({
    super.key,
    required this.onPressed,
    required this.doc_id,
    required this.patient_id,
  });
  final VoidCallback onPressed;
  final String doc_id;
  final String patient_id;

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
              MaterialPageRoute(
                  builder: (builder) => CameraScreen(
                        patient_id: patient_id,
                        doc_id: doc_id,
                      )));
        },
      ),
    );
  }
}
