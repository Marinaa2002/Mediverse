import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Recommendation%20System/data/repo/recommendation_repo_impl.dart';
import 'package:meta/meta.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit(this.recommendationRepoImpl)
      : super(RecommendationInitial());

  final RecommendationRepoImpl recommendationRepoImpl;

  void createRecommendation(String patientID) async {
    emit(RecommendationLoading());
    var result = await recommendationRepoImpl.getMedicalHistory(patientID);
    result.fold(
      (l) => emit(RecommendationFailure()),
      (r) {
        // check if list is empty
        if (r.isEmpty || r == []) emit(RecommendationEmpty());

        //create list of recommendations
        List<String> recommendations = [];

        //check BMI
        double BMI = -1.0;
        if (r.isNotEmpty) {
          if (r[r.length - 1]['Height'] != "" &&
              r[r.length - 1]['Weight'] != "") {
            double heightInM = double.parse(r[r.length - 1]['Height']) / 100;
            double Weight = double.parse(r[r.length - 1]['Weight']);
            BMI = Weight / pow(heightInM, 2);
          }
        }

        // declare flags and buckets
        int pressureViolation = 0;
        int glucoseViolation = 0;
        int cholesterolViolation = 0;
        int respiratoryViolation = 0;
        int heartRateViolation = 0;

        //loop on all records
        for (int i = 0; i < r.length; i++) {
          //check glucose level
          if (r[i]['Blood Glucose Level'] != "") {
            if (double.parse(r[i]['Blood Glucose Level']) < 5.7 ||
                double.parse(r[i]['Blood Glucose Level']) > 6.4)
              glucoseViolation++;
          }

          //check blood pressure
          if (r[i]['Blood Pressure'] != "") {
            List<String> bloodPressure = r[i]['Blood Pressure'].split('/');
            if (int.parse(bloodPressure[0]) > 130 ||
                int.parse(bloodPressure[1]) > 85) pressureViolation++;
          }

          // check cholesterol level
          if (r[i]['Cholesterol Levels'] != "") {
            if (int.parse(r[i]['Cholesterol Levels']) > 90)
              cholesterolViolation++;
          }

          //check respiratory rate
          if (r[i]['Respiratory Rate'] != "") {
            if (int.parse(r[i]['Respiratory Rate']) > 20)
              respiratoryViolation++;
          }

          //check heart rate
          if (r[i]['Heart Rate'] != "") {
            if (int.parse(r[i]['Heart Rate']) > 120 ||
                int.parse(r[i]['Heart Rate']) < 40) heartRateViolation++;
          }
        }

        // check for flags and buckets
        if (glucoseViolation >= 3) recommendations.add('Endocrinologist');
        if (pressureViolation >= 3) recommendations.add('Cardiologist');
        if (cholesterolViolation > 0) recommendations.add('Internist');
        if (respiratoryViolation > 0 && pressureViolation < 3)
          recommendations.add('Cardiologist');
        if (heartRateViolation > 0 &&
            pressureViolation < 3 &&
            respiratoryViolation == 0) recommendations.add('Cardiologist');
        if ((BMI > 35.0 || BMI < 25.0) && BMI != -1.0)
          recommendations.add('Nutritionist');

        if (recommendations.isEmpty) {
          emit(RecommendationEmpty());
        } else {
          // form string
          String recommend = recommendations[0];
          for (int i = 1; i < recommendations.length; i++) {
            recommend = recommend + ', ' + recommendations[i];
          }
          emit(RecommendationSuccess(speciality: recommend));
        }
      },
    );
  }
}
