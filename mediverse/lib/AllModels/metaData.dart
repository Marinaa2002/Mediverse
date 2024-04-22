class MetaData {
  String type;
  String email;

  MetaData({
    required this.type,
    required this.email,
  });

  factory MetaData.fromJson(json) {
    return MetaData(
        type: json['type'],
        email: json['email'] // Provide default values or handle null if needed
        );
  }
}
