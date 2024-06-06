

class BlogModel {
  final String title;
  final String author;
  final String date;
  final String time;
  final String blogBody;
  final String image;
  final String profile;
 // final int likes;

  BlogModel({
  //  required this.likes,
    required this.title,
    required this.author,
    required this.date,
    required this.time,
    required this.blogBody,
    required this.image,
    required this.profile,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      blogBody: json['blog body'] ?? '',
      image: json['image'] ?? '',
      profile: json['profile'] ?? '',
      //likes: json['likes']??0,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'date': date,
      'time': time,
      'blog body': blogBody,
      'image': image,
      'profile':profile,
   //   'likes':likes
    };
  }
}

//'assets/images/Human.jpg',