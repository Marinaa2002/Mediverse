import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class AppBarAdminPage extends StatelessWidget {
  const AppBarAdminPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
          child: Container(
            width: 53,
            height: 53,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/Human.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'AlexHubert Wong',
                style: TextStyle(fontSize: 14, color: kThirdTextColor),
              ),
              Text(
                'hubert.wong@gmail.com',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 14,
                  color: kThirdTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
