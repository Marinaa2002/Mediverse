import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constants.dart';

class BlogCardDoc extends StatelessWidget {
  const BlogCardDoc({super.key});

  @override
  Widget build(BuildContext context) {
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
                          'How Much Coffee Is Too\nMuch Coffee?',
                          textAlign: TextAlign.start,
                          style: Themes.bodyMedium,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                1, 0, 0, 0),
                            child: Text(
                              'By: Dr. Salem Hassan',
                              style: Themes.labelMedium,
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
                          child: Image.asset(
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
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
                      // Padding(
                      //   padding:
                      //       const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      //   child: CircleAvatar(

                      //     backgroundColor: accentBack,
                      //     child: IconButton(
                      //       iconSize: 44,
                      //       icon: const Icon(
                      //         Icons.favorite_border,
                      //         color: accent1,
                      //         size: 22,
                      //       ),
                      //       onPressed: () {
                      //         print('IconButton pressed ...');
                      //       },
                      //     ),
                      //   ),
                      // ),
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
