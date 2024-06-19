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

  Future<List<DocumentSnapshot>> fetchBookingDocs(List<dynamic> bookingIds) {
    return Future.wait(bookingIds.map((bookingId) =>
        FirebaseFirestore.instance
            .collection('Bookings')
            .doc(bookingId)
            .get()
    ).toList());
  }

  Future<List<DocumentSnapshot>> filterPrevBookings(List<dynamic> bookings, List<dynamic> prevBookings) async {
    final bookingDocs = await fetchBookingDocs(bookings);
    final prevBookingDocs = await fetchBookingDocs(prevBookings);

    final allBookings = [...bookingDocs, ...prevBookingDocs];
    allBookings.sort((a, b) {
      final dateA = parseDate((a.data() as Map<String, dynamic>)['Date']);
      final dateB = parseDate((b.data() as Map<String, dynamic>)['Date']);
      return dateB.compareTo(dateA);
    });

    final uniqueBookings = <String, DocumentSnapshot>{};
    for (var doc in allBookings) {
      final bookingData = doc.data() as Map<String, dynamic>?;
      final patientId = bookingData?['Patient_id'];
      if (patientId != null && !uniqueBookings.containsKey(patientId)) {
        uniqueBookings[patientId] = doc;
      }
    }
    return uniqueBookings.values.toList();
  }

  Future<Map<String, DocumentSnapshot>> fetchAllPatients(List<DocumentSnapshot> bookings) async {
    final patientIds = bookings.map((doc) {
      final bookingData = doc.data() as Map<String, dynamic>?;
      return bookingData?['Patient_id'];
    }).whereType<String>().toSet();

    final patientDocs = await Future.wait(
        patientIds.map((patientId) => FirebaseFirestore.instance.collection('info_Patients').doc(patientId).get())
    );
    return {for (var doc in patientDocs) doc.id: doc};
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
              onSearchPressed: () {},
              onSubmitted: (value) => (value) {},
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
                  try {
                    final data = snapshot.data!.data() as Map<String, dynamic>?;
                    List<dynamic> bookings = List<dynamic>.from(data?['Bookings'] ?? []);
                    List<dynamic> prevBookings = List<dynamic>.from(data?['Previous_Appointments'] ?? []);

                    if (bookings.isEmpty && prevBookings.isEmpty) {
                      return
                        Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                            Center(
                              child: Text(
                                "No Patient History Found",
                                style: Themes.bodyLarge.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
                              ),
                            ),
                          ],
                        );
                    }

                    return FutureBuilder<List<DocumentSnapshot>>(
                      future: filterPrevBookings(bookings, prevBookings),
                      builder: (context, filteredBookingsSnapshot) {
                        if (filteredBookingsSnapshot.connectionState == ConnectionState.waiting) {
                          return Loading();
                        }

                        if (!filteredBookingsSnapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Error loading previous bookings"),
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
                              final bookingData = doc.data() as Map<String, dynamic>?;
                              final patientData = patientsData[bookingData?['Patient_id']]?.data() as Map<String, dynamic>?;
                              return patientData?['Name'].toString().toLowerCase().contains(searchQueryLower) ?? false;
                            }).toList();

                            final displayedBookings = _searchQuery.isEmpty
                                ? filteredByName.take(8).toList()
                                : filteredByName;

                            return displayedBookings.isEmpty ? Center(
                              child: Text(
                                "No Results Found",
                                style: Themes.bodyLarge.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
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
                  } catch (e) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Error loading data",
                          style: Themes.bodyMedium.copyWith(fontSize: 18),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}