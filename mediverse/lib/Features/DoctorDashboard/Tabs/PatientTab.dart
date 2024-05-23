import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/data/repos/doc_appoints_repo_impl.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/presentation/Managers/cubit/doc_appoints_cubit.dart';
import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/presentation/BookingDoctor.dart';

import '../ChatsList/presentation/Views/ChatsList.dart';
import '../PatientHistoryScreen/presentation/Views/PatientHistoryScreen.dart';
import '../widgets/CurBookingsList.dart';

class PatientsTab extends StatelessWidget {
  const PatientsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 8, 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const BookingDoctor()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.sizeOf(context).width * 0.45,
                        37,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      backgroundColor: kprimaryColor,
                      textStyle: Themes.bodyXLarge.copyWith(
                        color: backgroundColor,
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Prev. Bookings',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const PatientHistory()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.sizeOf(context).width * 0.45,
                        37,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      backgroundColor: kprimaryColor,
                      textStyle: Themes.bodyXLarge.copyWith(
                        color: backgroundColor,
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Patinets\' History',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
            child: Divider(
              thickness: 2,
              color: Color.fromARGB(255, 224, 227, 231),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Text(
                'Active Bookings:',
                style: Themes.bodyMedium,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => DocAppointsCubit(DocAppointsRepoImpl()),
            child: CurBookingsList(),
          ),
        ],
      ),
    );
  }
}
