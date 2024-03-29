import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';

class PictureProfileWidget extends StatelessWidget {
  const PictureProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width*0.34,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 3,
                shape: const CircleBorder(),
                child: Container(
                  width: size.width*0.25,
                  height:size.width*0.25,
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
                      width: size.width*0.125,
                      height: size.width*0.125,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/Human.jpg',
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: ClipOval(
                child: Container(
                  width: size.width*0.1,
                  height: size.width*0.1,
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
                        width: size.width*0.125,
                        height: size.width*0.125,
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
