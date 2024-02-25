import 'package:mediverse/models/doctor.dart';

class hospital_staff{
  const hospital_staff({
    required this.id,
    required this.Hospital_Name,
    required this.Doctors,
  });

  final String id;
  final String Hospital_Name;
  final List<Doctor> Doctors;
}