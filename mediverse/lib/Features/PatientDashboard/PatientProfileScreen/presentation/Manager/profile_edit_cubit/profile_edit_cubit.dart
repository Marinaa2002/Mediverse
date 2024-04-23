import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/ProfilePatientRepo.dart';
part 'profile_edit_state.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit(this.editInfoRepo) : super(ProfileEditInitial());
  var details = FirebaseFirestore.instance.collection('info_Patients');

  final ProfilePatientRepo editInfoRepo;

  Future<void> editName({required String? name}) async {
    emit(ProfileEditSuccess());
    try {
      editInfoRepo.updateName(name: name);
    } on Exception catch (e) {
      emit(ProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editAge({required String? age}) async {
    emit(ProfileEditSuccess());
    try {
      editInfoRepo.updateAge(age: age);
    } on Exception catch (e) {
      emit(ProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editNationalId({required String? nationalId}) async {
    emit(ProfileEditSuccess());
    try {
      editInfoRepo.updateNationalId(nationalId: nationalId);
    } on Exception catch (e) {
      emit(ProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPhoneNum({required String? phoneNum}) async {
    emit(ProfileEditSuccess());
    try {
      editInfoRepo.updatePhoneNum(phoneNum: phoneNum);
    } on Exception catch (e) {
      emit(ProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPicture({required String? picture}) async {
    emit(ProfileEditLoading());
    try {
      editInfoRepo.updatePicture(picture: picture);
      emit(ProfileEditSuccess());
    } on Exception catch (e) {
      emit(ProfileEditFailure('Something went wrong, Try again'));
    }
  }
}
