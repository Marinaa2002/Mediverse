import '../../../../../AllModels/patient.dart';

class lab_staff {
  const lab_staff({
    required this.id,
    required this.Lab_Name,
    required this.Patients,
  });

  final String id;
  final String Lab_Name;
  final List<Patient> Patients;
}
