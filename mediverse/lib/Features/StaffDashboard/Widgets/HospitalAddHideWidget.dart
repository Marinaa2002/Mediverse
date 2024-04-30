import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/AddHideCubit/AddHideCubit.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/AddHideCubit/AddHideState.dart';

class HospitalAddHideWidget extends StatelessWidget {
  const HospitalAddHideWidget({
    super.key,
    required this.hospitalName,
    required this.onChanged,
    this.option = true,
    required this.staffid,
  });
  final hospitalName;
  final void Function(bool) onChanged;
  final option;
  final String staffid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
        ),
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                  child: Text(
                    hospitalName,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 12, 0, 0),
              child: Text(
                'Archive',
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: SwitchWidget(
                  staffid: staffid,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Text(
                'Show',
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  SwitchWidget({
    super.key,
    required this.staffid,
  });
  final String staffid;
  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool option = true;
  @override
  void initState() {
    super.initState();
    fetchData(); // Call the helper method to fetch data
  }

  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Staff')
          .doc(widget.staffid)
          .get();
      var condition = documentSnapshot['Condition'];

      // Update the option variable based on the condition
      setState(() {
        option = (condition == 'Show');
      });
    } catch (error) {
      // Handle any errors that occur during data fetching
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: option,
      onChanged: (bool value) {
        setState(() {
          option = value;
          if (value) {
            FirebaseFirestore.instance
                .collection('Staff')
                .doc(widget.staffid)
                .update({'Condition': 'Show'});
          } else {
            FirebaseFirestore.instance
                .collection('Staff')
                .doc(widget.staffid)
                .update({'Condition': 'Hide'});
          }
        });
      },
    );
  }
}
