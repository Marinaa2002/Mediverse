import 'dart:convert';
import 'dart:developer';

import 'package:mediverse/Core/utils/api_service.dart';
import 'package:http/http.dart' as http;

class EmailService {
  final ApiService apiService = ApiService();
  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final serviceID = 'service_yo90c7i';
    final template_id = 'template_g5e8d0r';
    final user_id = 'x0PSZcFpV5OULTvVo';
    // final url = 'https://api.emailjs.com/api/v1.0/email/send';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      body: json.encode({
        'service_id': serviceID,
        'template_id': template_id,
        'user_id': user_id,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
  }
}
