import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorBlogs/data/models/BlogsModel.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/BlogCardEdit.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/SearchBoxAppointmentWidget.dart';

class MyBlogs extends StatefulWidget {
  @override
  _MyBlogsState createState() => _MyBlogsState();
}

class _MyBlogsState extends State<MyBlogs> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<BlogModel> _allBlogs = [];

  void _onSearchPressed() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void onDelete() {
    setState(() {});
  }

  void onEdit() {
    setState(() {});
  }

  void _search() {
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<BlogModel>> _fetchBlogs() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }

    final doctorDocSnapshot = await FirebaseFirestore.instance
        .collection('info_Doctors')
        .doc(currentUser.uid)
        .get();

    final doctorData = doctorDocSnapshot.data();
    final List<dynamic> blogIds = doctorData?['Blogs'] ?? [];

    List<BlogModel> blogs = [];
    for (String blogId in blogIds) {
      final blogDoc = await FirebaseFirestore.instance
          .collection('Blogs')
          .doc(blogId)
          .get();
      if (blogDoc.exists) {
        var blogData = blogDoc.data() as Map<String, dynamic>;
        var blog = BlogModel.fromJson(blogData);
        blog.docId = blogDoc.id;
        blogs.add(blog);
      }
    }

    blogs.sort((a, b) {
      var aDateTime = parseDate(a.date, a.time);
      var bDateTime = parseDate(b.date, b.time);
      return bDateTime.compareTo(aDateTime);
    });

    _allBlogs = blogs;
    return blogs;
  }

  List<BlogModel> _filterBlogs(List<BlogModel> blogs, String query) {
    return blogs.where((blog) {
      final titleLower = blog.title.toLowerCase();
      final bodyLower = blog.blogBody.toLowerCase();
      final authorLower = blog.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          bodyLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
  }

  DateTime parseDate(String date, String time) {
    final months = {
      'Jan': '01',
      'Feb': '02',
      'Mar': '03',
      'Apr': '04',
      'May': '05',
      'Jun': '06',
      'Jul': '07',
      'Aug': '08',
      'Sep': '09',
      'Oct': '10',
      'Nov': '11',
      'Dec': '12',
    };

    final dateParts = date.split(' ');
    final day = dateParts[1].replaceAll(',', '').padLeft(2, '0');
    final month = months[dateParts[0]]!;
    final year = dateParts[2];

    final timeParts = time.split(' ')[1].split(':');
    final hour = timeParts[0].padLeft(2, '0');
    final minute = timeParts[1];
    final period = time.split(' ')[2];

    final formattedTime = period == 'AM'
        ? (hour == '12' ? '00' : hour) + ':' + minute
        : (hour == '12' ? hour : (int.parse(hour) + 12).toString()) +
        ':' +
        minute;

    final formattedDate = '$year-$month-$day $formattedTime:00';
    return DateTime.parse(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Blogs',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
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
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          SearchBoxAppointmentWidget(
            controller: _searchController,
            onChanged: _onSearchChanged,
            onSearchPressed: () {},
            onSubmitted: (value) => (value) {},
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<BlogModel>>(
              future: _fetchBlogs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Loading());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error loading blogs'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No blogs found'));
                }

                List<BlogModel> blogs = _searchQuery.isEmpty
                    ? snapshot.data!
                    : _filterBlogs(_allBlogs, _searchQuery);

                return blogs.isEmpty
                    ? Center(
                  child: Text(
                    "No Results Found",
                    style: Themes.bodyLarge.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: blogs.length > 10 ? 10 : blogs.length,
                  itemBuilder: (context, index) {
                    var blog = blogs[index];
                    return BlogCardEdit(
                      title: blog.title,
                      author: blog.author,
                      date: blog.date,
                      time: blog.time,
                      body: blog.blogBody,
                      image: blog.image,
                      profile: blog.profile,
                      docId: blog.docId,
                      onDelete: onDelete,
                      onEdit: onEdit,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}