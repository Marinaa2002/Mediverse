import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomCheckIcon.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDashedLine.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/Thank_you_Widget.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.isCash});
  final bool isCash;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(
            isCash: isCash,
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
