import 'package:flutter/material.dart';
import 'consts.dart';

class Themes {
  static TextStyle headline = const TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.w500,
  );

 static TextStyle bigHeadline = const TextStyle(
   fontFamily: 'Plus Jakarta Sans',
   fontSize: 33,
   fontWeight: FontWeight.bold,
 );

  static TextStyle textSmall =const TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.bold,
  );

  static TextStyle fieldText= const TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  color: Color(0xFF57636C),
  fontSize: 14,
  fontWeight: FontWeight.w500,
  );



  static TextStyle bodyMed=const TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  color: Color(0xFF101213),
  fontSize: 14,
  fontWeight: FontWeight.w500,
  );

  static TextStyle labelMed=TextStyle(
  fontFamily: 'Readex Pro',
  fontSize: 18,
  fontWeight: FontWeight.w600,
  );

  static TextStyle titleButton=TextStyle(
  fontFamily: 'Readex Pro',
  fontWeight: FontWeight.w600,
  color:Color(0xFF57636C),
  fontSize: 15
  );

  static TextStyle titleSmall=TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle title=TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelColored= TextStyle(
  fontFamily: 'Readex Pro',
  color: Color(0xFF4B39EF),
  fontWeight: FontWeight.w500,
  fontSize: 17,
  );

  static TextStyle splashBoldTitle= TextStyle(
    fontFamily: 'Outfit',
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static TextStyle verySmallText= const TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    color:Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
}