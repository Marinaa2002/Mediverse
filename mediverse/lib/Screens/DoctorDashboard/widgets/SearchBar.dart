import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  static final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
          child: Container(
            width: 320,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.indigo,
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
                color: Colors.indigo,
              ),
            ),
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: TextFormField(
                controller: _textController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Search ',
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 15, 0, 0),
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
    );
  }
}
