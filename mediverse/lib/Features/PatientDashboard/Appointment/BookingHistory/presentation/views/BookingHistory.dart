import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/BookingCard.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/presentation/Managers/cubit/booking_history_cubit.dart';

class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Bookings History',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: kSecondryBackgroundColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
        builder: (context, state) {
          if (state is BookingHistorySuccess) {
            return SafeArea(
              child: Expanded(
                child: ListView(
                  children: context
                      .read<BookingHistoryCubit>()
                      .makeBookingsWidgets(state.bookings, state.doctorNames),
                ),
                // child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: state.bookings.length,
                //     itemBuilder: (context, i) {
                //       return BookingCard(
                //         booking: state.bookings[i],
                //         patient_name: state.doctorNames[i],
                //         displayPatientName: false,
                //       );
                //     }),
              ),
            );
          } else if (state is BookingHistoryFailure) {
            return Center(
              child: Text("Error"),
            );
          } else {
            return Loading();
          }
        },
      ),
    );
  }
}
