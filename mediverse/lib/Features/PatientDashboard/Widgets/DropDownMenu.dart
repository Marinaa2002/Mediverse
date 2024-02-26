import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Views/BookingScreen.dart';

import '../../../Constants/constant.dart';

class DropDownMenu extends StatelessWidget {
  var dropdownValue;

  DropDownMenu({
    super.key,
    required dropdownValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      elevation: 16,
      style: const TextStyle(color: kprimaryTextColor),
      underline: Container(
        height: 2,
        color: kprimaryColor,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void setState(Null Function() param0) {}
}
