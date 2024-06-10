import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import '../../../../PatientDashboard/Widgets/CustomEditConfirm.dart';
import '../../../widgets/CustomTextFieldBlogs.dart';

class BlogsAdd extends StatefulWidget {
  @override
  _BlogsAddState createState() => _BlogsAddState();
}

class _BlogsAddState extends State<BlogsAdd> {
  File? sampleImage;
  String? _myValue;
  String? _myBlogTitle;
  String? _myAuthor;
  String? _Profile;
  String? url;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        sampleImage = File(pickedFile.path);
      });
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> uploadBlog() async {
    if (validateAndSave()) {
      final storageRef = FirebaseStorage.instance.ref().child("PostImages");
      var timeKey = DateTime.now().toString();
      if (sampleImage != null) {
        var snapshot = await storageRef.child(timeKey + '.jpg').putFile(sampleImage!);
        var imgUrl = await snapshot.ref.getDownloadURL();
        url = imgUrl;
      }
      Navigator.pop(context);
      saveToDatabase(url ?? '', timeKey);
    }
  }

  void saveToDatabase(String url, String documentName) async {
    var dbTimeKey = DateTime.now();
    String date = DateFormat('MMM d, yyyy').format(dbTimeKey);
    String time = DateFormat('EEEE, hh:mm aaa').format(dbTimeKey);
    await FirebaseFirestore.instance.collection("Blogs").add({
      "image": url,
      "title": _myBlogTitle,
      "author": _myAuthor,
      "blog body": _myValue,
      "date": date,
      "time": time,
      "profile": _Profile,
    }).then((docRef) {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection("info_Doctors").doc(userId).update({
        "Blogs": FieldValue.arrayUnion([docRef.id])
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Create new Blog',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload() {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();

    return Container(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (sampleImage != null)
               Container(
                 width: MediaQuery.of(context).size.width*0.85,
                  height: 200,
                 decoration: BoxDecoration(
                   border:Border.all(
                     color: kprimaryColor,
                     width: 3
                   )
                 ),
                 child:Image.file(sampleImage!, height: 200, width: 500,),),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldBlogs(
                    text: 'Blog Title',
                    TextEditingController: _titleController,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldBlogs(
                    text: 'Description',
                    TextEditingController: _descriptionController,
                  ),
                ),
              ),
              SizedBox(height: 5),
              InkWell(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    var authorSnapshot = await FirebaseFirestore.instance
                        .collection('info_Doctors')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get();

                    if (authorSnapshot.exists) {
                      var authorName = authorSnapshot.get('Name');
                      _myBlogTitle = _titleController.text;
                      _myAuthor = authorName;
                      _myValue = _descriptionController.text;
                      _Profile = authorSnapshot.get('Profile_Picture') ?? 'default_profile_picture_url';
                      uploadBlog();
                    } else {
                    }
                  }
                },
                child: CustomEditConfirm(text: 'Post Blog',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
