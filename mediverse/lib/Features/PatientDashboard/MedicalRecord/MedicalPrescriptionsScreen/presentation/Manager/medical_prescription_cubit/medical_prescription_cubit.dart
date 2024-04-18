import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/models/medical_prescription_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/repos/medical_prescription_repo.dart';
import 'package:meta/meta.dart';

part 'medical_prescription_state.dart';

class MedicalPrescriptionCubit extends Cubit<MedicalPrescriptionState> {
  MedicalPrescriptionCubit(this.medicalPrescriptionRepo) : super(MedicalPrescriptionInitial());

  final MedicalPrescriptionRepo medicalPrescriptionRepo;
  var messages =
  FirebaseFirestore.instance;//.collection('medicalPrescriptions');
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  void sendLabModel({required String now_date, required String imageUrl}) {
    emit(MedicalPrescriptionLoading());
    try {
      medicalPrescriptionRepo.sendLabs(now_date: now_date, imageUrl: imageUrl);
    } on Exception catch (e) {
      emit(MedicalPrescriptionFailure('Something went wrong, Try again'));
    }
  }

  void getLabModels() async{
    emit(MedicalPrescriptionLoading());
    await messages.collection('info_Patients/$currentUser/medical prescriptions').orderBy('createdAt', descending: true).snapshots().listen((event) async {
      var result = await medicalPrescriptionRepo.getLabs(event: event);
      result.fold((left) =>
          emit(MedicalPrescriptionFailure(left.errMsg)),
              (right) =>
              emit(MedicalPrescriptionSuccess(medicalModelList: right))
      );
    });
  }
}
