import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';

class RowOfRequestWidget extends StatelessWidget {
  const RowOfRequestWidget({
    super.key,
    required this.requestModelField,
    required this.requestField,
  });

  final String requestModelField;
  final String requestField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              requestField,
              style: const TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              requestModelField,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
