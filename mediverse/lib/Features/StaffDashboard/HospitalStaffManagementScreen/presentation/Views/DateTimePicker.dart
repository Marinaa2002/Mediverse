import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Functions.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key, required this.id, required this.orgName});
  final String id;
  final String orgName;
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _selectedDateTime = DateTime.now();
  TextEditingController textEditingController = TextEditingController();

  CollectionReference appointments =
      FirebaseFirestore.instance.collection('Appointments');

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      barrierColor: Colors.white,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDateTime) {
      final TimeOfDay? pickedTime = await showTimePicker(
        barrierColor: Colors.white,
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void SaveSlots() async {
    // Access the selected date and time from _selectedDateTime variable
    DateTime selectedDateTime = _selectedDateTime;
    final slot = await showTextFieldDialog(
      context,
      textEditingController: textEditingController,
      hintText: "Enter the doctor's available slots(hr)",
      title: 'Slots',
    );
    if (slot != null) {
      appointments.add({
        'D_uid': widget.id,
        'HospitalName': widget.orgName,
        'FromDateDay': selectedDateTime.day,
        'FromDateHour': selectedDateTime.hour,
        'FromDateMonth': selectedDateTime.month,
        'FromDateYear': selectedDateTime.year,
        'TODateDay': selectedDateTime.day,
        'TODateHour': selectedDateTime.hour + num.parse(slot!),
        'TODateMonth': selectedDateTime.month,
        'TODateYear': selectedDateTime.year,
        'isPaid': false,
        'currency': 'egp',
        'availableSlotsInHr': num.parse(slot),
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Select Date and Time',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kprimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selected Date and Time:',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              DateFormat('yyyy-MM-dd hh:mm a').format(_selectedDateTime),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kprimaryColor, // Set the background color
              ),
              onPressed: () => _selectDateTime(context),
              child: const Text(
                'Choose Date and Time',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kprimaryColor, // Set the background color
              ),
              onPressed: SaveSlots,
              child: const Text(
                'Save ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
