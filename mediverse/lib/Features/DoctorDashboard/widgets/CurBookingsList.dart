import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/presentation/Managers/cubit/doc_appoints_cubit.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/CurrentBookingCard.dart';

class CurBookingsList extends StatefulWidget {
  const CurBookingsList({
    super.key,
  });

  @override
  State<CurBookingsList> createState() => _CurBookingsListState();
}

class _CurBookingsListState extends State<CurBookingsList> {
  @override
  void initState() {
    BlocProvider.of<DocAppointsCubit>(context)
        .getBookingsList(globalcurrentUserId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocAppointsCubit, DocAppointsState>(
      builder: (context, state) {
        if (state is DocAppointsSuccess) {
          return (!state.bookings.isEmpty)
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.bookings.length,
                      itemBuilder: (context, i) {
                        return CurBookingCard(
                          booking: state.bookings[i],
                          patient_name: state.names[i],
                        );
                      }),
                )
              : Center(
                  child: Text('No Active Bookings'),
                );
        } else if (state is DocAppointsFailed) {
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
