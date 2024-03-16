import 'package:flutter/material.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/CurrentBookingCard.dart';

class CurBookingsList extends StatelessWidget {
  const CurBookingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CurBookingCard(),
            CurBookingCard(),
            CurBookingCard(),
            CurBookingCard(),
          ],
        ),
      ),
    );
  }
}
