import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/AllModels/doctor.dart';

class dummyDoctor {
  void createDoctor() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('info_Doctors')
        .doc('GCdsPwoGDUp36lOBGJUJ')
        .get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    Doctor dummydoc = Doctor(
      id: 'GCdsPwoGDUp36lOBGJUJ',
      Name: data['Name'],
      Age: data['Age'],
      Phone: data['Phone'],
      Email: data['Email'],
      National_id: data['NationalId'],
      profile_picture: data['Profile_Picture'],
      State: data['State'],
      Speciality: data['Speciality'],
      License_Number: data['License_Number'],
      Rating: data['Rating'],
      Reviews: data['Reviews'],
      Clinics: data['Clinics'],
      Slots: data['Slots'],
      Blogs: data['Blogs'],
      Patients: data['Patients'],
      Prev_Appointments: data['Previous_Appointments'],
      Bookings: data['Bookings'],
    );

    print(dummydoc);
  }
}
