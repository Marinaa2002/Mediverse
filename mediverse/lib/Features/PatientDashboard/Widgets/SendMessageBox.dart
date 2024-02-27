import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(241, 211, 189, 2),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Send Message',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: kSecondaryTextColor,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: kSecondaryTextColor,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
