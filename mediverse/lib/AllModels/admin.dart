import 'package:mediverse/AllModels/request.dart';

class Admin {
  const Admin({
    required this.id,
    required this.Name,
    required this.Phone,
    required this.Email,
    required this.Requests,
  });

  final String id;
  final String Name;
  final String Phone;
  final String Email;
  final List<Request> Requests;
}
