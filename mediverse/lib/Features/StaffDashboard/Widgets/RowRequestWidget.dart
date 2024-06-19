import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            Flexible(
              flex: 1,
              child: Text(
                requestField,
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Space between the texts
            Flexible(
              child: Text(
                requestModelField,
                style: const TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
