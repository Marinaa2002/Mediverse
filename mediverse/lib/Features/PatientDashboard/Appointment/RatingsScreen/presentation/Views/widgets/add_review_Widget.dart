import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/data/models/reviewModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/presentation/Manager/patient_review_cubit/patient_review_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/RatingsScreen/presentation/Views/widgets/add_button_widget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomRatingIcon.dart';

import '../../../../../../../Constants/Themes.dart';
import '../../../../../../../Constants/constant.dart';
import 'ReviewScreenBody.dart';
import 'RatingCardWidget.dart';
import 'RatingIconWidget.dart';

class AddReviewWidget extends StatelessWidget {
  String? text;
  double? rating;
  String? name;
  String imageUrl = '';
  AddReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: kSecondryBackgroundColor,
              size: 24,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Add Review',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocBuilder<PatientReviewCubit, PatientReviewState>(
            builder: (context, state) {
          if (state is PatientReviewSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, -1),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text('Add Your Review :',
                              style: Themes.labelLarge18),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(8),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 8),
                                child: TextFormField(
                                  obscureText: false,
                                  onChanged: (value) {
                                    name = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Write Your Name',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                  ),
                                  maxLines: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
                          child: Text('Tell others what you think',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 16,
                                color: Colors.black,
                              )),
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
                        onRatingUpdate: (rate) {
                          rating = rate;
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            width: double.infinity,
                            height: 300,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 8, 5, 8),
                                child: TextFormField(
                                  obscureText: false,
                                  onChanged: (value) {
                                    text = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Write Your Review Here',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                  ),
                                  maxLines: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AddButtonWidget(
                          text: 'Save',
                          onPressed: () {
                            BlocProvider.of<PatientReviewCubit>(context)
                                .sendReviewModel(
                                    rating: rating!,
                                    textReview: text!,
                                    name: name!);
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is PatientReviewFailure) {
            return Text('Try again');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
