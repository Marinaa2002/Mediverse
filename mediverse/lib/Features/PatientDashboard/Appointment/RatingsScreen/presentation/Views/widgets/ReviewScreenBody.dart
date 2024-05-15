import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/models/reviewModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/presentation/Manager/patient_review_cubit/patient_review_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomRatingIcon.dart';

import '../../../../../../../Constants/Themes.dart';
import '../../../../../../../Constants/constant.dart';
import 'RatingCardWidget.dart';
import 'RatingIconWidget.dart';
import 'add_button_widget.dart';
import 'add_review_Widget.dart';

class ReviewScreenBody extends StatefulWidget {
  ReviewScreenBody({
    super.key,
  });

  @override
  State<ReviewScreenBody> createState() => _ReviewScreenBodyState();
}

class _ReviewScreenBodyState extends State<ReviewScreenBody> {
  List<ReviewModel> reviewModelList = [];

  String? noOfRatings;

  double? avg_Ratings;

  ReviewModel? reviewModel;

  @override
  void initState() {
    BlocProvider.of<PatientReviewCubit>(context).getDoctorReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientReviewCubit, PatientReviewState>(
      builder: (context, state) {
        if (state is PatientReviewSuccess) {
          reviewModelList = state.reviewModellList;

          double totalRating = 0.0;
          for (var review in reviewModelList) {
            totalRating += review.Rating;
          }
          avg_Ratings = totalRating / reviewModelList.length;

          print(reviewModelList);
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                        child: Text(reviewModelList.length.toString(),
                            style: Themes.labelLarge26),
                      ),
                      Text('# of Ratings', style: Themes.DateText),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                            child: Text(
                                double.parse(
                                        (totalRating / reviewModelList.length)
                                            .toString())
                                    .toStringAsFixed(1),
                                style: Themes.labelLarge26),
                          ),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 12),
                              child: RatingIconWidget(
                                color: Colors.amber,
                              )),
                        ],
                      ),
                      Text('Avg. Rating', style: Themes.DateText),
                    ],
                  ),
                ],
              ),
              AddButtonWidget(
                  text: 'Add Your Review',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<PatientReviewCubit>(context),
                          child: AddReviewWidget(),
                        ),
                      ),
                    ).then((value) => initState());
                    
                  }),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: reviewModelList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        RatingCardWidget(
                          reviewModel: reviewModelList[index],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is PatientReviewFailure) {
          return Text('Try again');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
