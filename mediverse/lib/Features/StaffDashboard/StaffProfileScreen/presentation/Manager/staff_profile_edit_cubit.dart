import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../data/repos/StaffProfileRepo.dart';

part 'staff_profile_edit_state.dart';

class StaffProfileEditCubit extends Cubit<StaffProfileEditState> {
  StaffProfileEditCubit(this.editInfoRepo) : super(StaffProfileEditInitial());
  var details = FirebaseFirestore.instance.collection('Staff');

  final StaffProfileRepo editInfoRepo;

  Future<void> editName({required String? name}) async {
    emit(StaffProfileEditSuccess());
    try {
      editInfoRepo.updateName(name: name);
    } on Exception catch (e) {
      emit(StaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editLocation({required String? location}) async {
    emit(StaffProfileEditSuccess());
    try {
      editInfoRepo.updateLocation(location: location);
    } on Exception catch (e) {
      emit(StaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editOrgName({required String? orgName}) async {
    emit(StaffProfileEditSuccess());
    try {
      editInfoRepo.updateOrgName(orgName: orgName);
    } on Exception catch (e) {
      emit(StaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editOrgType({required String? orgType}) async {
    emit(StaffProfileEditSuccess());
    try {
      editInfoRepo.updateOrgType(orgType: orgType);
    } on Exception catch (e) {
      emit(StaffProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPicture({required String? picture}) async {
    emit(StaffProfileEditLoading());
    try {
      editInfoRepo.updatePicture(picture: picture);
      emit(StaffProfileEditSuccess());
    } on Exception catch (e) {
      emit(StaffProfileEditFailure('Something went wrong, Try again'));
    }
  }
}
