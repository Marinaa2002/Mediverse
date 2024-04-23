import 'package:emailjs/emailjs.dart';

class EmailService {
  void sendEmail(message, subject, email) async {
    try {
      await EmailJS.send(
        'service_yo90c7i',
        'template_av8arm2',
        {
          'user_email': email,
          'message': message,
          'subject': subject,
        },
        const Options(
          publicKey: 'x0PSZcFpV5OULTvVo',
          privateKey: 'eNTW3JYpW0Xz5opCIs4-v',
        ),
      );
      print('SUCCESS!');
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
    }
  }
}
