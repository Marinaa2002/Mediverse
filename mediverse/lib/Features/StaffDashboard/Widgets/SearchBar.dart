import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';
import 'TextFormFieldDoctors.dart';

class SearchBarDoctors extends StatelessWidget {
  const SearchBarDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
          child: Center(
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                color: kSecondryBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                    spreadRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: kprimaryColor,
                ),
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: TextFormFieldDoctors()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: const Color(0xFFF1F4F8),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.search,
                color: Color(0xFF57636C),
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
