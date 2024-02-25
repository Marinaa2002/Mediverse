import 'package:flutter/material.dart';

import 'BookingCard.dart';

class PrevBookingsList extends StatelessWidget {
  const PrevBookingsList({
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
            BookingCard(),
            BookingCard(),
            BookingCard(),
            BookingCard(),
            BookingCard(),
            BookingCard(),
            BookingCard(),
          ],
        ),
      ),
    );
  }
}
