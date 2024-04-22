import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/PrevBookingsList.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/SearchBarCustom.dart';

class BookingDoctor extends StatefulWidget {
  const BookingDoctor({super.key});

  @override
  State<BookingDoctor> createState() => _BookingDoctorState();
}

class _BookingDoctorState extends State<BookingDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Prevoius Bookings',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: const SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SearchBarCustom(),
            PrevBookingsList(),
          ],
        ),
      ),
    );
  }
}
