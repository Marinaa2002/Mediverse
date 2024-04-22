import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../data/repo/medicalRepo_repo_impl.dart';

part 'save_data_state.dart';
class SaveDataCubit extends Cubit<SaveDataState> {
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  SaveDataCubit() : super(SaveDataInitial());

  void saveDataMedicalRec({
    required String height,
    required String weight,
    required String bloodType,
    required String bloodPressure,
    required String bloodGlucoseLevel,
    required String cholesterolLevels,
    required String allergies,
    required String heartRate,
    required String respiratoryRate,
    required String temperature,
    required String surgicalHistory,
  }) async {
    emit(SaveDataLoading());
    try {
      SaveDataRepoImpl saveDataRepo = SaveDataRepoImpl();

      await saveDataRepo.saveData(
        height: height,
        weight: weight,
        bloodType: bloodType,
        bloodPressure: bloodPressure,
        bloodGlucoseLevel: bloodGlucoseLevel,
        cholesterolLevels: cholesterolLevels,
        allergies: allergies,
        heartRate: heartRate,
        respiratoryRate: respiratoryRate,
        temperature: temperature,
        surgicalHistory: surgicalHistory,
      );
      emit(SaveDataSuccess());
    } on Exception catch (e) {
      emit(SaveDataFailure(errMsg: 'Something went wrong, Try again'));
    }
  }
}


