import 'package:flutter/material.dart';
import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';
import 'CustomCardRatings.dart';
import 'CustomRatingIcon.dart';

class ReviewPageBody extends StatelessWidget {
  const ReviewPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x39000000),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(size.width*0.001, size.height*0.02, size.width*0.001, size.height*0.026),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text('2,503', style: Themes.labelLarge26),
                        ),
                        Text('# of Ratings', style: Themes.label12),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Text('4.6', style: Themes.labelLarge26),
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 12),
                                child: CustomRatingIconWidget(
                                  color: Colors.yellow,
                                )),
                          ],
                        ),
                        Text('Avg Rating', style: Themes.label12),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: kprimaryColor,
              ),
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Add Your Review :', style: Themes.labelLarge18),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                  child:
                      Text('Tell others what you think', style: Themes.label14),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRatingIconWidget(color: Colors.grey),
                  CustomRatingIconWidget(color: Colors.grey),
                  CustomRatingIconWidget(color: Colors.grey),
                  CustomRatingIconWidget(color: Colors.grey),
                  CustomRatingIconWidget(color: Colors.grey),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child:  Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      size.width * 0.02, size.height * 0.01, size.width * 0.02, size.height * 0.01),
                  child: Container(
                    width: size.width * 0.95,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
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
                    //  alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(size.width*0.03, size.height*0.01, 0, 0),

                      child: TextFormField(
                        autofillHints: [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Write Your Review Here ',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kprimaryColor,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              //   width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomCardRatings(name: 'Vacation Home'),
        CustomCardRatings(name: 'Vacation Home'),
        CustomCardRatings(name: 'Vacation Home'),
        CustomCardRatings(name: 'Vacation Home'),
      ],
    );
  }
}

