import 'package:flutter/material.dart';

import '../../../../../../Constants/constant.dart';

class ProfilePictureWidget extends StatelessWidget {
  var userData;
  ProfilePictureWidget({
    super.key, required this.userData
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 3,
                shape: const CircleBorder(),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kprimaryColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        userData['Profile Picture'] == null ? 'assets/images/Human.jpg': userData['Profile Picture'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: ClipOval(
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: kSecondryBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kprimaryColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        'assets/images/draw.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
