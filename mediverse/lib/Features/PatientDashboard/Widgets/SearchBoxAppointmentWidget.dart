import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class SearchBoxAppointmentWidget extends StatelessWidget {
  const SearchBoxAppointmentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  size.width * 0.02, size.height * 0.01, size.width * 0.02, 0),
              child: Container(
                width: size.width * 0.85,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
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
              //  alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(size.width*0.03, size.height*0.01, 0, 0),

                  child: TextFormField(
                    autofillHints: [AutofillHints.email],
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search ',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kprimaryColor,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                       //   width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, size.height * 0.01, 0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF1F4F8),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
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
        ),
      ],
    );
  }
}
