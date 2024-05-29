import 'package:flutter/material.dart';

class ConstantStyle {
  static BoxShadow lowerBoxShadow = const BoxShadow(
    color: Color.fromARGB(88, 57, 56, 56),
    offset: Offset(4, 4),
    blurRadius: 0.40,
    // spreadRadius: 1.0,
  );
  static BoxShadow upperBoxShadow = const BoxShadow(
    color: Color.fromARGB(81, 244, 244, 244),
    offset: Offset(-5, -5),
    blurRadius: 1.0,
    spreadRadius: 1.0,
  );
  static BoxShadow upperBooxShadow = const BoxShadow(
    color: Color.fromARGB(176, 57, 56, 56),
    offset: Offset(-8, -8),
    blurRadius: 0.40,
  );
}
