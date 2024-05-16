import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/presentation/Managers/cubit/doc_appoints_cubit.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/CurrentBookingCard.dart';

class CurBookingsList extends StatelessWidget {
  const CurBookingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocAppointsCubit, DocAppointsState>(
      builder: (context, state) {
        if (state is DocAppointsSuccess) {
          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // CurBookingCard(),
                  // CurBookingCard(),
                  // CurBookingCard(),
                  // CurBookingCard(),
                ],
              ),
            ),
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
