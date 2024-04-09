class Booking {
  const Booking( {
    required this.id,
    required this.Doctor_id,
    required this.Patient_id,
    required this.Date,
    required this.Day,
    required this.Location,
    required this.State,
  });

  final String id;
  final String Doctor_id;
  final String Patient_id;
  final String Date;
  final String Day;
  final String Location;
  final String State;
}
