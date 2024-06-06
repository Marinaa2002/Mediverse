
import 'package:flutter/cupertino.dart';
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
  }) : super(key: key);

  final String title, author, image, time, date, body, profile;

  @override
  _BlogCardDocState createState() => _BlogCardDocState();
}

class _BlogCardDocState extends State<BlogCardDoc> {
  int counter = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.title}',
                          textAlign: TextAlign.start,
                          style: Themes.bodyMedium,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Text(
                              'By: Dr.${widget.author}',
                              style: Themes.labelColored,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: widget.profile.isNotEmpty
                              ? Image.network(
                            widget.profile,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            'assets/images/Human.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 4,),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget.body,
                        style: Themes.bodyLarge.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 4,),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: widget.image.isNotEmpty ? MediaQuery.of(context).size.width * 0.6 : 0,
                  decoration: BoxDecoration(),
                  child: widget.image.isNotEmpty
                      ? Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(210, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.date} at ${widget.time.substring(widget.time.indexOf(' ') + 1)}',
                        style: Themes.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              // Align(
              //   alignment: const AlignmentDirectional(0, 0),
              //   child: Padding(
              //     padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.max,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.favorite,
              //           color: isLiked ? Colors.red : Colors.grey,
              //           size: 24,
              //         ),
                      // Padding(
                      //   padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      //   child: Text(
                      //     '$counter',
                      //     style: Themes.bodyLarge,
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      //   child: CircleAvatar(
                      //     backgroundColor: accentBack,
                      //     child: IconButton(
                      //       iconSize: 44,
                      //       icon: Icon(
                      //         Icons.favorite_border,
                      //         color: accent1,
                      //         size: 22,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           if (isLiked) {
                      //             counter--;
                      //           } else {
                      //             counter++;
                      //           }
                      //           isLiked = !isLiked;
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

    );
  }
}
