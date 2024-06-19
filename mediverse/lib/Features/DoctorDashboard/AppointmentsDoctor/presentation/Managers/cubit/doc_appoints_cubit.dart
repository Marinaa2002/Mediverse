import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/AppointmentsDoctor/data/repos/doc_appoints_repo_impl.dart';
import 'package:meta/meta.dart';

part 'doc_appoints_state.dart';

class DocAppointsCubit extends Cubit<DocAppointsState> {
  DocAppointsCubit(this.docAppointsRepoImpl) : super(DocAppointsInitial());

  final DocAppointsRepoImpl docAppointsRepoImpl;

  // custom order for weekdays
  final Map<String, int> weekdayOrder = {
    'Saturday': 0,
    'Sunday': 1,
    'Monday': 2,
    'Tuesday': 3,
    'Wednesday': 4,
    'Thursday': 5,
    'Friday': 6,
  };

  void getBookingsList(String doctor_id) async {
    emit(DocAppointsLoading());
    var bookings_result = await docAppointsRepoImpl.getBookings(doctor_id);
    bookings_result.fold(
      (left) => emit(DocAppointsFailed()),
      (right) async {
        // Sort the list using the custom order
        right.sort(
            (a, b) => weekdayOrder[a.Day]!.compareTo(weekdayOrder[b.Day]!));
        var names_result = await docAppointsRepoImpl.getPatientNames(right);
        names_result.fold(
          (l) => emit(DocAppointsFailed()),
          (r) => emit(DocAppointsSuccess(bookings: right, names: r)),
        );
      },
    );
  }

  void changeBookingStatus(
    List<Booking> bookingsList,
    List<String> namesList,
    Booking booking,
  ) async {
    var result = await docAppointsRepoImpl.moveToPrevAppoints(booking);
    result.fold(
      (l) => emit(DocAppointsFailed()),
      (r) async {
        int bookingIndex = -1;
        for (int i = 0; i < bookingsList.length; i++) {
          if (bookingsList[i].id == booking.id) bookingIndex = i;
        }
        removeTimeSlot(
            globalcurrentUserId,
            bookingsList[bookingIndex].Date,
            bookingsList[bookingIndex].Time,
            bookingsList[bookingIndex].Location);
        bookingsList.removeAt(bookingIndex);

        namesList.removeAt(bookingIndex);
        emit(DocAppointsSuccess(bookings: bookingsList, names: namesList));
      },
    );
  }

  Future<void> removeTimeSlot(String docId, String targetDate,
      String targetTime, String targetSlotName) async {
    // Step 1: Fetch the Document and Cast Data
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('info_Doctors')
        .doc(docId)
        .get();

    // Safely cast the document data to a Map
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;

    if (data == null || !data.containsKey('Slots')) {
      // Handle case where data or slots are null
      print('No data or slots found');
      return;
    }

    // Safely cast Slots to List<dynamic>
    List<dynamic> slots = data['Slots'] as List<dynamic>;

    // Step 2: Find the Index of the Time Slot and Remove It
    bool slotFound = false;
    for (var slot in slots) {
      if (slot is Map<String, dynamic> && slot['Name'] == targetSlotName) {
        List<dynamic>? timeSlots = slot['Time Slots'] as List<dynamic>?;

        if (timeSlots != null) {
          for (var timeSlot in timeSlots) {
            if (timeSlot is Map<String, dynamic> &&
                timeSlot['Date'] == targetDate) {
              List<dynamic>? times = timeSlot['Time'] as List<dynamic>?;
              List<dynamic>? statuses = timeSlot['Status'] as List<dynamic>?;

              if (times != null && statuses != null) {
                int indexToUpdate = times.indexOf(targetTime);
                if (indexToUpdate != -1) {
                  // Remove the time and corresponding status
                  // Update the status to 'free' at the corresponding index
                  statuses[indexToUpdate] = 'free';
                  slotFound = true;
                  break;
                }
              }
            }
          }
        }
      }
      if (slotFound) {
        break;
      }
    }

    // Step 3: Update the Document in Firestore
    if (slotFound) {
      await FirebaseFirestore.instance
          .collection('info_Doctors')
          .doc(docId)
          .update({'Slots': slots});
      print('Slot removed successfully');
    } else {
      print('No matching slot found to remove');
    }
  }
}
