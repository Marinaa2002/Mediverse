import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_States.dart';

import '../../../data/models/PaymentIndentInputModel.dart';

class PaymentStripeCubit extends Cubit<PaymentStripeState> {
  PaymentStripeCubit(this.checkoutRepo, this.booking)
      : super(PaymentStripeStateInitial());

  final Booking booking;

  final CheckOutRepo checkoutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentStripeStateLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (left) => emit(PaymentStripeStateFailure(left.errMsg)),
      (right) => emit(
        PaymentStripeStateSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentStripeState> change) {
    log(change.toString());
    super.onChange(change);
  }

  void addBookingToDoctor() {
    final String doctor_id = booking.Doctor_id;
    FirebaseFirestore.instance
        .collection('info_Doctors')
        .doc(doctor_id)
        .update({
      'Bookings': FieldValue.arrayUnion([booking.id]),
    });
  }

  void addBookingToPatient() {
    final String patient_id = booking.Patient_id;
    FirebaseFirestore.instance
        .collection('info_Patients')
        .doc(patient_id)
        .update({
      'Bookings': FieldValue.arrayUnion([booking.id]),
    });
  }

  void reserveSlot() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('info_Doctors')
        .doc(booking.Doctor_id)
        .get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    List slots = data['Slots'];

    for (int i = 0; i < slots.length; i++) {
      if (slots[i]['Name'] == booking.Location) {
        for (int j = 0; j < slots[i]['Time Slots'].length; j++) {
          if (slots[i]['Time Slots'][j]['Date'] == booking.Date) {
            for (int k = 0; k < slots[i]['Time Slots'][j]['Time'].length; k++) {
              if (slots[i]['Time Slots'][j]['Time'][k] == booking.Time) {
                slots[i]['Time Slots'][j]['Status'][k] = "booked";
                break;
              }
            }
            break;
          }
        }
        break;
      }
    }

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('info_Doctors')
        .doc(booking.Doctor_id);

    documentReference.update({
      'Slots': slots,
    });
  }

  void completeBooking(String status) {
    addBookingToDoctor();
    addBookingToPatient();
    reserveSlot();

    FirebaseFirestore.instance.collection('Bookings').doc(booking.id).update({
      'State': status,
    });
  }
}
