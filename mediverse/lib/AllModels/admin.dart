import 'dart:convert';

class Admin {
  const Admin({
    required this.name,
    required this.phone,
    required this.email,
    required this.imageUrl,
  });

  final String name;
  final String phone;
  final String email;
  final String imageUrl;

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        name: json['Name'] as String, // Convert to lowercase
        phone: json['Phone'] as String, // Convert to lowercase
        email: json['Email'] as String,
        imageUrl: json['imageUrl'] as String // Convert to lowercase
        );
  }
}
