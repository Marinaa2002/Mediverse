
class Review {
  const Review({
    required this.id,
    required this.Doctor_id,
    required this.Patient_id,
    required this.Rating,
    required this.Text,
  });

  final String id;
  final String Doctor_id;
  final String Patient_id;
  final int Rating;
  final String Text;
}
