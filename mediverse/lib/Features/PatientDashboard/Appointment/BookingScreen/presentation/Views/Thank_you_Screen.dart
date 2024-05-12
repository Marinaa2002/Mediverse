import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/Thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.isCash});
  final bool isCash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).popUntil(
                (route) => route.settings.name == '/mainScreenPatient');
          },
        ),
        title: Text(
          'Booking',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: ThankYouViewBody(
        isCash: isCash,
      ),
    );
  }
}
