class Admin {
  const Admin({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  final String id;
  final String name;
  final String phone;
  final String email;

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'] as String,
      name: json['Name'] as String, // Convert to lowercase
      phone: json['Phone'] as String, // Convert to lowercase
      email: json['Email'] as String, // Convert to lowercase
    );
  }
}
