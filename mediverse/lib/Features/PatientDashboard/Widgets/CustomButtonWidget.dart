import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
      child: GestureDetector(
        onTap: () {},
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: primaryColor,
            elevation: 3,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload_sharp,
                    size: 22,
                  ),
               //   const SizedBox(width:20 ),
                  Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Readex Pro',
                      fontSize: 17
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
