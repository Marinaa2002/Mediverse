import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

import '../../../../Widgets/BookingForm.dart';

const List<String> paymentMethods = <String>[
  'Select Payment Method..',
  'Cash at arrival',
  'Card',
  'PayPal',
];

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key, required this.booking});
  Booking booking;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
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
            Navigator.of(context).pop();
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: BookingForm(booking: booking),
        ),
      ),
    );
  }
}
