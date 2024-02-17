import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constants.dart';

class SearchBarCustom extends StatelessWidget {
  static final _textController = TextEditingController();

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
              width: 350,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: TextFormField(
                  controller: _textController,
                  style: Themes.bodyMedium.copyWith(fontSize: 15),
                  cursorHeight: 20,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Search ',
                    labelStyle: Themes.labelMedium,
                    hintStyle: Themes.labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: kprimaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
                  ),
                ),
              ),
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
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.search,
                color: Color(0xFF57636C),
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
