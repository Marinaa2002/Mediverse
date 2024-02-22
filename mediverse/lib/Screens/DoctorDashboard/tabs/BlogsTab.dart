import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/BlogCardDoc.dart';

class BlogsTab extends StatelessWidget {
  const BlogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: const Alignment(-1, -1),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Write a new Blog:',
                    style: Themes.bodyMedium,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: kSecondryBackgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                            spreadRadius: 3,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: kprimaryColor,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextFormField(
                                  // don't forget controller and validator
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: Themes.labelMedium,
                                    hintText: 'Write Here ...',
                                    hintStyle: Themes.bodyLarge.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: kSecondaryTextColor,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 0),
                                  ),
                                  style: Themes.bodyXLarge.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 8,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 5, 10, 5),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  backgroundColor: kprimaryColor,
                                  textStyle: Themes.bodyXLarge.copyWith(
                                    color: backgroundColor,
                                  ),
                                  elevation: 3,
                                ),
                                child: const Text('Post'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlogCardDoc(),
              BlogCardDoc(),
              BlogCardDoc(),
            ],
          ),
        ),
      ),
    );
  }
}
