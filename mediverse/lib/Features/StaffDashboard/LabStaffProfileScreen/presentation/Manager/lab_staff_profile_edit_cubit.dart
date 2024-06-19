import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../data/repos/LabStaffProfileRepo.dart';

part 'lab_staff_profile_edit_state.dart';

class LabStaffProfileEditCubit extends Cubit<LabStaffProfileEditState> {
  LabStaffProfileEditCubit(this.editInfoRepo) : super(LabStaffProfileEditInitial());
  var details = FirebaseFirestore.instance.collection('Staff');

  final LabStaffProfileRepo editInfoRepo;

  Future<void> editName({required String? name}) async {
    emit(LabStaffProfileEditSuccess());
    try {
      editInfoRepo.updateName(name: name);
    } on Exception catch (e) {
      emit(LabStaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editLocation({required String? location}) async {
    emit(LabStaffProfileEditSuccess());
    try {
      editInfoRepo.updateLocation(location: location);
    } on Exception catch (e) {
      emit(LabStaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editOrgName({required String? orgName}) async {
    emit(LabStaffProfileEditSuccess());
    try {
      editInfoRepo.updateOrgName(orgName: orgName);
    } on Exception catch (e) {
      emit(LabStaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editOrgType({required String? orgType}) async {
    emit(LabStaffProfileEditSuccess());
    try {
      editInfoRepo.updateOrgType(orgType: orgType);
    } on Exception catch (e) {
      emit(LabStaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPicture({required String? picture}) async {
    emit(LabStaffProfileEditLoading());
    try {
      editInfoRepo.updatePicture(picture: picture);
      emit(LabStaffProfileEditSuccess());
    } on Exception catch (e) {
      emit(LabStaffProfileEditFailure('Something went wrong, Try again'));
    }
  }
}
