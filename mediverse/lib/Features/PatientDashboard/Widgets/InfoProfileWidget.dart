import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: kSecondryBackgroundColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kprimaryColor,
                            width: 2,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: kprimaryTextColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ' Notifications',
                    textAlign: TextAlign.center,
                    style: Themes.titleSmall.copyWith(
                      fontFamily: 'Readex Pro',
                      color: kprimaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: kSecondryBackgroundColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kprimaryColor,
                          width: 2,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: const Icon(
                        Icons.help_outline_outlined,
                        color: kprimaryTextColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Help Center',
                  textAlign: TextAlign.center,
                  style: Themes.titleSmall.copyWith(
                    fontFamily: 'Readex Pro',
                    color: kprimaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
