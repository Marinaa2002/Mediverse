import 'dart:ffi';

class Blog {
  const Blog({
    required this.id,
    required this.title,
    required this.Doctor_id,
    required this.Reaction,
    required this.Text,
  });

  final String id;
  final String title;
  final String Doctor_id;
  final Float Reaction;
  final String Text;
}
