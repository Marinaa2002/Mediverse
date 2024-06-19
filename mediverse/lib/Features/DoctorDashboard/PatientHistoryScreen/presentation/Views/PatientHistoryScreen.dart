import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/HistoryCard.dart';
import '../../../../Beginning/LoginScreen/presentation/views/Loading.dart';
import '../../../../PatientDashboard/Widgets/SearchBoxAppointmentWidget.dart';

class PatientHistory extends StatefulWidget {
  @override
  _PatientHistoryState createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  DateTime parseDate(String dateString) {
    final months = {
      'January': '01',
      'February': '02',
      'March': '03',
      'April': '04',
      'May': '05',
      'June': '06',
      'July': '07',
      'August': '08',
      'September': '09',
      'October': '10',
      'November': '11',
      'December': '12',
    };

    final parts = dateString.split(' - ');
    final day = parts[0].padLeft(2, '0');
    final month = months[parts[1]]!;
    final year = DateTime.now().year.toString();
    final formattedDate = '$year-$month-$day';
    return DateTime.parse(formattedDate);
  }

  Future<List<DocumentSnapshot>> fetchBookingDocs(List<dynamic> bookingIds) async {
    List<Future<DocumentSnapshot>> futures = bookingIds.map((bookingId) =>
        FirebaseFirestore.instance.collection('Bookings').doc(bookingId).get()
    ).toList();

    List<DocumentSnapshot> results = await Future.wait(futures);
    return results;
  }

  Future<List<DocumentSnapshot>> filterBookings(List<dynamic> bookings, List<dynamic> prevBookings) async {
    List<DocumentSnapshot> bookingDocs = await fetchBookingDocs([...bookings, ...prevBookings]);
    bookingDocs.sort((a, b) => b['Date'].compareTo(a['Date']));
    Set<String> patientIds = {};
    List<DocumentSnapshot> uniqueBookings = [];

    for (var doc in bookingDocs) {
      String patientId = doc['Patient_id'];
      if (!patientIds.contains(patientId)) {
        patientIds.add(patientId);
        uniqueBookings.add(doc);
      }
    }

    return uniqueBookings;
  }

  Future<Map<String, DocumentSnapshot>> fetchAllPatients(List<DocumentSnapshot> bookings) async {
    Set patientIds = bookings.map((booking) => booking['Patient_id']).toSet();

    List<Future<DocumentSnapshot>> futures = patientIds.map((patientId) =>
        FirebaseFirestore.instance.collection('info_Patients').doc(patientId).get()
    ).toList();

    List<DocumentSnapshot> results = await Future.wait(futures);

    return { for (var doc in results) doc.id: doc };
  }

  void _onSearchPressed() {
    setState(() {
      _searchQuery = _searchController.text;
      _search();
    });
  }

  void _search() {
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          'Patients\' History',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SearchBoxAppointmentWidget(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSearchPressed: _onSearchPressed,
              onSubmitted: (value) => _onSearchPressed(),
            ),
            Expanded(
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('info_Doctors')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  }

                  if (!snapshot.hasData || snapshot.data!.data() == null) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "No data available",
                            style: Themes.bodyMedium.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  }

                  final data = snapshot.data!.data() as Map<String, dynamic>?;
                  List<dynamic> bookings = List<dynamic>.from(data?['Bookings'] ?? []);
                  List<dynamic> prevBookings = List<dynamic>.from(data?['Previous_Appointments'] ?? []);

                  if (bookings.isEmpty && prevBookings.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                        Center(
                          child: Text(
                            "No Patient History Found",
                            style: Themes.bodyLarge.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
                          ),
                        ),
                      ],
                    );
                  }

                  return FutureBuilder<List<DocumentSnapshot>>(
                    future: filterBookings(bookings, prevBookings),
                    builder: (context, filteredBookingsSnapshot) {
                      if (filteredBookingsSnapshot.connectionState == ConnectionState.waiting) {
                        return Loading();
                      }

                      if (!filteredBookingsSnapshot.hasData) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Error loading bookings"),
                        );
                      }

                      List<DocumentSnapshot> filteredBookings = filteredBookingsSnapshot.data!;

                      return FutureBuilder<Map<String, DocumentSnapshot>>(
                        future: fetchAllPatients(filteredBookings),
                        builder: (context, patientsSnapshot) {
                          if (patientsSnapshot.connectionState == ConnectionState.waiting) {
                            return Loading();
                          }

                          if (!patientsSnapshot.hasData) {
                            return const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("Error loading patients data"),
                            );
                          }

                          final patientsData = patientsSnapshot.data!;

                          final searchQueryLower = _searchQuery.toLowerCase();
                          final filteredByName = filteredBookings.where((doc) {
                            final patientData = patientsData[doc['Patient_id']]?.data() as Map<String, dynamic>?;
                            return patientData?['Name'].toString().toLowerCase().contains(searchQueryLower) ?? false;
                          }).toList();

                          final displayedBookings = _searchQuery.isEmpty
                              ? filteredByName.take(8).toList()
                              : filteredByName;

                          return displayedBookings.isEmpty
                              ? Center(
                            child: Text(
                              "No Results Found",
                              style: Themes.bodyLarge.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
                            ),
                          )
                              : ListView.builder(
                            itemCount: displayedBookings.length,
                            itemBuilder: (context, index) {
                              final bookingData = displayedBookings[index].data() as Map<String, dynamic>?;
                              final patientData = patientsData[bookingData?['Patient_id']]?.data() as Map<String, dynamic>?;

                              if (bookingData == null || patientData == null) {
                                return const ListTile(
                                  title: Text("Error loading booking or patient data"),
                                );
                              }

                              final List<Map<String, String>> medicalHistoryList = List<Map<String, String>>.from(
                                (patientData['Medical Records'] ?? []).map((item) => Map<String, String>.from(item)),
                              );

                              Map<String, String>? lastMedicalHistory;

                              if (medicalHistoryList.isNotEmpty) {
                                lastMedicalHistory = medicalHistoryList.last;
                              }

                              return ListTile(
                                title: HistoryCard(
                                  patientName: patientData['Name'],
                                  email: patientData['Email'],
                                  profilePicture: patientData['Profile Picture'],
                                  appointmentDate: bookingData['Date'],
                                  age: patientData['Age'],
                                  medicalHistory: lastMedicalHistory != null ? [lastMedicalHistory] : [],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
