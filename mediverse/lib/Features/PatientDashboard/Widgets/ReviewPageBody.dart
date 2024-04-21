import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 24),
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
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Text('4.6', style: Themes.labelLarge26),
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 12),
                                child: CustomRatingIconWidget(
                                  color: Colors.yellow,
                                )),
                          ],
                        ),
                        Text('Avg. Rating', style: Themes.label12),
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
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomRatingIconWidget(color: Colors.grey),
              //     CustomRatingIconWidget(color: Colors.grey),
              //     CustomRatingIconWidget(color: Colors.grey),
              //     CustomRatingIconWidget(color: Colors.grey),
              //     CustomRatingIconWidget(color: Colors.grey),
              //   ],
              // ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
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
                        color: Colors.indigo,
                      ),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 8, 5, 8),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Write Your Review Here',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          ),
                          maxLines: 10,
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
