
class Blog {
  const Blog({
    required this.Doctor_Name,
    required this.Doctor_Picture,
    required this.id,
    required this.title,
    required this.Doctor_id,
    required this.likes,
    required this.Text,
  });

  final String id;
  final String title;
  final String Doctor_id;
  final String Doctor_Name;
  final String Doctor_Picture;
  final num likes;
  final String Text;
}
