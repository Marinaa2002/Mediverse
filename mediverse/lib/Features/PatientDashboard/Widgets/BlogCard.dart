import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class BlogCardDoc extends StatefulWidget {
  BlogCardDoc({
    Key? key,
    required this.title,
    required this.author,
    required this.image,
    required this.time,
    required this.date,
    required this.body,
    required this.profile,
    required this.likes,
    required this.likedUsers,
    required this.docId,
  }) : super(key: key);

  final String title, author, image, time, date, body, profile, docId;
  int likes;
  List<String> likedUsers;

  @override
  _BlogCardDocState createState() => _BlogCardDocState();
}

class _BlogCardDocState extends State<BlogCardDoc> {
  bool isLiked = false;
  late User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null && widget.likedUsers.contains(user!.uid)) {
      isLiked = true;
    }
  }

  Future<void> _updateLikes() async {
    final docRef = FirebaseFirestore.instance.collection('Blogs').doc(widget.docId);
    if (isLiked) {
      widget.likes++;
      widget.likedUsers.add(user!.uid);
    } else {
      widget.likes--;
      widget.likedUsers.remove(user!.uid);
    }
    await docRef.update({'likes': widget.likes, 'likedUsers': widget.likedUsers});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        decoration: BoxDecoration(
          color: kSecondryBackgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  widget.image,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.title,
                style: Themes.bodyMedium
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.body,
                  style:
                  Themes.bodyLarge.copyWith(fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${widget.date} at ${widget.time.substring(widget.time.indexOf(' ') + 1)}',
                  style: Themes.labelMedium,
                ),
              ),
            ),

            Divider(
              thickness: 2,
              color: Color.fromARGB(255, 224, 227, 231),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: widget.profile.isNotEmpty
                            ? NetworkImage(widget.profile)
                            : AssetImage('assets/images/Human.jpg')
                        as ImageProvider,
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Dr. ${widget.author}',
                        style: Themes.labelColored,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                        onPressed: user != null
                            ? () {
                          setState(() {
                            isLiked = !isLiked;
                            _updateLikes();
                          });
                        }
                            : null,
                      ),
                      Text(
                        '${widget.likes}',
                        style: Themes.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
