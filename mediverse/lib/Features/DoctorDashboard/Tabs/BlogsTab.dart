import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/SearchBoxAppointmentWidget.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';
import '../../PatientDashboard/Widgets/BlogCard.dart';
import '../DoctorBlogs/data/models/BlogsModel.dart';
import '../DoctorBlogs/presentation/views/Blogs_Add_Page.dart';

class BlogsTab extends StatelessWidget {
  const BlogsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BlogsTab(),
    );
  }
}

class _BlogsTab extends StatefulWidget {
  @override
  _BlogsTabState createState() => _BlogsTabState();
}

class _BlogsTabState extends State<_BlogsTab> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Write a new Blog:',
                      style: Themes.primaryText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlogsAdd()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        backgroundColor: kprimaryColor,
                        textStyle: Themes.bodyMedium.copyWith(
                          color: backgroundColor,
                        ),
                        elevation: 3,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Color.fromARGB(255, 224, 227, 231),
              ),
              SizedBox(height: 10),
              SearchBoxAppointmentWidget(
                controller: _searchController,
                onChanged: _onSearchChanged,
                onSearchPressed: () {},
                onSubmitted: (value) => (value) {},
              ),
              SizedBox(height: 10),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Blogs')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Loading());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error loading blogs'));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No blogs found'));
                    }

                    List<BlogModel> blogs = snapshot.data!.docs.map((doc) {
                      var blogData = doc.data() as Map<String, dynamic>;
                      var blog = BlogModel.fromJson(blogData);
                      blog.docId = doc.id;
                      return blog;
                    }).toList();

                    blogs.sort((a, b) {
                      var aDateTime = parseDate(a.date, a.time);
                      var bDateTime = parseDate(b.date, b.time);
                      return bDateTime.compareTo(aDateTime);
                    });

                    if (_searchQuery.isNotEmpty) {
                      blogs = _filterBlogs(blogs, _searchQuery);
                    }

                    return blogs.isEmpty
                        ? Center(
                            child: Text(
                            "No Results Found",
                            style: Themes.bodyLarge.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ))
                        : ListView.builder(
                            itemCount: blogs.length > 10 ? 10 : blogs.length,
                            itemBuilder: (context, index) {
                              var blog = blogs[index];
                              return BlogCardDoc(
                                title: blog.title,
                                author: blog.author,
                                date: blog.date,
                                time: blog.time,
                                body: blog.blogBody,
                                image: blog.image,
                                profile: blog.profile,
                                likes: blog.likes,
                                likedUsers: blog.likedUsers,
                                docId: blog.docId,
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
