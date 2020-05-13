import 'package:flutter/material.dart';

class AppTheme {

  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );
  
  static final TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.white.withOpacity(0.8),
    fontSize: 35,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2
  );


  static final TextStyle subHeading = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.white.withOpacity(0.9),
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );

  static final TextStyle body = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.white.withOpacity(0.8),
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0,
    height: 1.2 
  );

}