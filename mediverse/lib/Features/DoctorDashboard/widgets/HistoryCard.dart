import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import '../ViewMedicalHistory/presentation/Views/ViewMedicalHistory.dart';

class HistoryCard extends StatelessWidget {
  final String patientName;
  final String email;
  final String age;
  final String profilePicture;
  final String appointmentDate;
  final List<Map<String, String>> medicalHistory;

  const HistoryCard({
    super.key,
    required this.patientName,
    required this.profilePicture,
    required this.appointmentDate,
    required this.medicalHistory,
    required this.email,
    required this.age,
    //required lastAppointmentDate,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        decoration: BoxDecoration(
          color: kSecondryBackgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 9,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patientName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Last Appointment: $appointmentDate',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: kprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            profilePicture,
                            width: 67,
                            height: 67,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    screenSize.width * 0.001,
                    screenSize.height * 0.001,
                    screenSize.width * 0.01,
                    screenSize.height * 0.01,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ViewHistory(
                          patientName: patientName,
                          age: age,
                          email: email,
                          profilePicture: profilePicture,
                          medicalHistory: medicalHistory,
                        ),
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(kprimaryColor),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      elevation: MaterialStateProperty.all<double>(3),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: kprimaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      width: screenSize.width * 0.40,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
