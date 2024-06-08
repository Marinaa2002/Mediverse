import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/DoctorProfileRepo.dart';

part 'doctor_profile_edit_state.dart';

class DoctorProfileEditCubit extends Cubit<DoctorProfileEditState> {
  DoctorProfileEditCubit(this.editInfoRepo) : super(DoctorProfileEditInitial());

  var details = FirebaseFirestore.instance.collection('info_Doctors');

  final DoctorProfileRepo editInfoRepo;

  Future<void> editName({required String? name}) async {
    emit(DoctorProfileEditSuccess());
    try {
      editInfoRepo.updateName(name: name);
    } on Exception catch (e) {
      emit(DoctorProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editAge({required String? age}) async {
    emit(DoctorProfileEditSuccess());
    try {
      editInfoRepo.updateAge(age: age);
    } on Exception catch (e) {
      emit(DoctorProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editNationalId({required String? nationalId}) async {
    emit(DoctorProfileEditSuccess());
    try {
      editInfoRepo.updateNationalId(nationalId: nationalId);
    } on Exception catch (e) {
      emit(DoctorProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPhoneNum({required String? phoneNum}) async {
    emit(DoctorProfileEditSuccess());
    try {
      editInfoRepo.updatePhoneNum(phoneNum: phoneNum);
    } on Exception catch (e) {
      emit(DoctorProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPicture({required String? picture}) async {
    emit(DoctorProfileEditLoading());
    try {
      editInfoRepo.updatePicture(picture: picture);
      emit(DoctorProfileEditSuccess());
    } on Exception catch (e) {
      emit(DoctorProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editSpeciality({required String? speciality}) async {
    emit(DoctorProfileEditSuccess());
    try {
      editInfoRepo.updateSpeciality(speciality: speciality);
    } on Exception catch (e) {
      emit(DoctorProfileEditFailure('Something went wrong, Try again'));
    }
  }
}
