import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class BlogCardDoc extends StatelessWidget {
  const BlogCardDoc({super.key, required this.title, required this.DrName});

  final String title, DrName;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.96,
        decoration: BoxDecoration(
          color: kSecondryBackgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
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
                padding:  EdgeInsetsDirectional.fromSTEB(size.width*0.03, 10, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title',
                          textAlign: TextAlign.start,
                          style: Themes.bodyMedium,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                1, 0, 0, 0),
                            child: Text(
                              'By: $DrName',
                              style: Themes.labelMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: size.width*0.15,
                      height: size.width*0.15,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: SizedBox(
                        width: size.width*0.3,
                        height: size.width*0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80.0),
                          child: Image.asset(
                            'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                            width: size.width*0.3,
                            height: size.width*0.3,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.fromSTEB(size.width*0.03, 10, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Themes.bodyLarge.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(size.width*0.01, size.height*0.009, size.width*0.01, size.height*0.02),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 24,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          '45',
                          style: Themes.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: CircleAvatar(
                          backgroundColor: accentBack,
                          child: IconButton(
                            iconSize: 44,
                            icon: const Icon(
                              Icons.favorite_border,
                              color: accent1,
                              size: 22,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          child: CircleAvatar(
                            backgroundColor: accentBack,
                            child: IconButton(
                              iconSize: 44,
                              icon: const Icon(
                                Icons.ios_share,
                                color: accent1,
                                size: 22,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
