import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle titleStyle = TextStyle(
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.black,
  );
  static TextStyle boldText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.white,
  );
}
