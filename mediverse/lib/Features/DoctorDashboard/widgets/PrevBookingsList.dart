import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/presentation/Managers/cubit/doc_bookings_cubit.dart';

import '../../../Constants/Themes.dart';
import 'BookingCard.dart';

class PrevBookingsList extends StatefulWidget {
  const PrevBookingsList({
    super.key,
  });

  @override
  State<PrevBookingsList> createState() => _PrevBookingsListState();
}

class _PrevBookingsListState extends State<PrevBookingsList> {
  @override
  void initState() {
    BlocProvider.of<DocBookingsCubit>(context)
        .getDocPrevBookings(globalcurrentUserId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocBookingsCubit, DocBookingsState>(
      builder: (context, state) {
        if (state is DocBookingsSearch) {
          return (!state.newBookings.isEmpty)
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.newBookings.length,
                      itemBuilder: (context, i) {
                        return BookingCard(
                          booking: state.newBookings[i],
                          name: state.newNames[i],
                          displayPatientName: true,
                        );
                      }),
                )
              : Center(
                  child: Text('No previous bookings with this info'),
                );
        } else if (state is DocBookingsSuccess) {
          return (!state.bookings.isEmpty)
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.bookings.length,
                      itemBuilder: (context, i) {
                        return BookingCard(
                          booking: state.bookings[i],
                          name: state.names[i],
                          displayPatientName: true,
                        );
                      }),
                )
              :
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
              Center(
                child: Text(
                  "No Previous Bookings",
                  style: Themes.bodyLarge.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                    ),
            ],
          );
        } else if (state is DocBookingsFailure) {
          return Center(
            child: Text("Error"),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
