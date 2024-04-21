import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';

class RowOfAppointmentTab extends StatelessWidget {
  const RowOfAppointmentTab({
    super.key,
    required this.fieldValue,
    required this.field,
  });

  final String fieldValue;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            field + ':',
            style: const TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
          SizedBox(width: 10),
          Text(
            fieldValue,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
