import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class HospitalAddHideWidget extends StatelessWidget {
  const HospitalAddHideWidget({super.key, required this.hospitalName});
  final String hospitalName;

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
            const Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'San Pola Hospital',
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
                child: Switch.adaptive(
                    value: true, onChanged: (newValue) async {}),
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
