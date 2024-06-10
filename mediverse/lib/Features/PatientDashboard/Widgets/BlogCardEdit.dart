import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class BlogCardEdit extends StatefulWidget {
  BlogCardEdit({
    Key? key,
    required this.title,
    required this.author,
    required this.image,
    required this.time,
    required this.date,
    required this.body,
    required this.profile,
    required this.docId,
    required this.onDelete,
    required this.onEdit
  }) : super(key: key);

  final String title, author, image, time, date, body, profile, docId;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  _BlogCardEditState createState() => _BlogCardEditState();
}

class _BlogCardEditState extends State<BlogCardEdit> {
  late User? user;

  @override
  void initState() {
    super.initState();
  }

  void _editBlog() {
    var dbTimeKey = DateTime.now();
    String date = DateFormat('MMM d, yyyy').format(dbTimeKey);
    String time = DateFormat('EEEE, hh:mm aaa').format(dbTimeKey);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = widget.title;
        String newBody = widget.body;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title:
              Row( mainAxisAlignment: MainAxisAlignment.start,
                children: [
                IconButton(onPressed: (){}, icon:Icon( Icons.edit , color: kprimaryColor, size: 25,),),
                Text("Edit Blog", style: Themes.labelColored.copyWith(fontSize: 20)),
              ],),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: widget.title,
                    onChanged: (value) {
                      setState(() {
                        newTitle = value;
                      });
                    },
                    decoration: InputDecoration(
                     // border: InputBorder.none,
                      labelText: 'Title',
                        labelStyle:Themes.bodysmall.copyWith(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    initialValue: widget.body,
                    onChanged: (value) {
                      setState(() {
                        newBody = value;
                      });
                    },
                    decoration: InputDecoration(
                        //border: InputBorder.none,
                        labelText: 'Body',
                        labelStyle:Themes.bodysmall.copyWith(color: Colors.grey,fontSize: 15)
                    ),
                    maxLines: null,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',style: TextStyle(color: kprimaryColor),),
                ),
                TextButton(
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      final docRef = FirebaseFirestore.instance.collection('Blogs').doc(widget.docId);
                      await docRef.update({
                        'title': newTitle,
                        'blog body': newBody,
                        'time': time,
                        'date': date,
                      });
                      Navigator.pop(context);
                    }
                    widget.onEdit();
                  },
                  child: Text('Save',style: TextStyle(color: kprimaryColor),),
                ),
              ],
            );
          },
        );
      },
    );
  }


  Future<void> _deleteBlog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){}, icon:Icon( Icons.warning , color: kprimaryColor, size: 25,),),
            //SizedBox(width: 15,),
            Text("Delete Blog ?", style: Themes.labelColored.copyWith(fontSize: 20)),
           ],
          ),
          content:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize:MainAxisSize.min ,
                children: [
                Text("Are you sure you want to delete this blog?",style: Themes.bodyMed,),
                Text("This action cannot be undone",style: Themes.bodysmall.copyWith(color: Colors.grey,fontSize: 14),)
              ],),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  final batch = FirebaseFirestore.instance.batch();
                  batch.delete(FirebaseFirestore.instance.collection('Blogs').doc(widget.docId));
                  final doctorDocRef = FirebaseFirestore.instance.collection('info_Doctors').doc(user.uid);
                  batch.update(doctorDocRef, {
                    'Blogs': FieldValue.arrayRemove([widget.docId])
                  });
                  await batch.commit();
                  widget.onDelete();
                }
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      widget.image,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
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
                  style: Themes.bodyLarge.copyWith(fontWeight: FontWeight.normal),
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
                      IconButton(onPressed: (){_editBlog();}, icon: Icon(Icons.edit_note_outlined)),
                      IconButton(onPressed: (){_deleteBlog();}, icon:Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

