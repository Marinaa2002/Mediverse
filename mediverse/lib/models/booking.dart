class Booking {
  const Booking({
    required this.id,
    required this.Doctor_id,
    required this.Patient_id,
    required this.dateTime,
    required this.Location,
    required this.State,
  });

  final String id;
  final String Doctor_id;
  final String Patient_id;
  final DateTime dateTime;
  final String Location;
  final String State;
}
