class MRmodel {
  final String height;
  final String weight;
  final String bloodType;
  final String bloodPressure;
  final String bloodGlucoseLevel;
  final String cholesterolLevels;
  final String allergies;
  final String heartRate;
  final String respiratoryRate;
  final String temperature;
  final String surgicalHistory;

  MRmodel({
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.bloodPressure,
    required this.bloodGlucoseLevel,
    required this.cholesterolLevels,
    required this.allergies,
    required this.heartRate,
    required this.respiratoryRate,
    required this.temperature,
    required this.surgicalHistory,
  });

  factory MRmodel.fromJson(Map<String, dynamic> json) {
    return MRmodel(
      height: json['Height'] ?? '',
      weight: json['Weight'] ?? '',
      bloodType: json['Blood Type'] ?? '',
      bloodPressure: json['Blood Pressure'] ?? '',
      bloodGlucoseLevel: json['Blood Glucose Level'] ?? '',
      cholesterolLevels: json['Cholesterol Levels'] ?? '',
      allergies: json['Allergies'] ?? '',
      heartRate: json['Heart Rate'] ?? '',
      respiratoryRate: json['Respiratory Rate'] ?? '',
      temperature: json['Temperature'] ?? '',
      surgicalHistory: json['Surgical History'] ?? '',
    );
  }
}