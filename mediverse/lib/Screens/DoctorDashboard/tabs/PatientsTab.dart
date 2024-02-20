import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constants.dart';
import 'package:mediverse/screens/DoctorDashboard/BookingDoctor.dart';
import 'package:mediverse/screens/DoctorDashboard/ChatsList.dart';
import 'package:mediverse/screens/DoctorDashboard/PatientHistoryScreen.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/CurrentBookingCard.dart';

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
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 5, 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const PatientHistory()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(185, 37),
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
                    child: const Text('Patients\' History'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ChatsList()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(185, 37),
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
                    child: const Text('Chats'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed ...');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const BookingDoctor()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(185, 37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                backgroundColor: kprimaryColor,
                textStyle: Themes.bodyXLarge.copyWith(
                  color: backgroundColor,
                ),
                elevation: 3,
              ),
              child: const Text('Bookings'),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
            child: Divider(
              thickness: 2,
              color: Color.fromARGB(255, 224, 227, 231),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Day: ',
                  style: Themes.bodyMedium,
                ),
                Text(
                  'Tues, Nov 07',
                  style: Themes.titleSmall.copyWith(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          const Expanded(
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
          ),
        ],
      ),
    );
  }
}
