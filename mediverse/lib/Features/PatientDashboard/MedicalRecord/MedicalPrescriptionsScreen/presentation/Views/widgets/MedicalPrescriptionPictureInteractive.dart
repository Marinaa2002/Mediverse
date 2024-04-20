
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionLoadingIndicator.dart';


class MedicalPrescriptionPictureInteractive extends StatelessWidget {
  MedicalPrescriptionPictureInteractive({super.key, required this.imageUrl});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0),
      child: Container(
        height: 650,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: Alignment(0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: InteractiveViewer(
              child: CachedNetworkImage(
                height: 650,
                width: 300,
                fit: BoxFit.contain,
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => const Icon(Icons.alarm),
                placeholder: (context, url) => MedicalPrescriptionLoadingIndicatorWidget(),
                alignment: Alignment(0, 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}