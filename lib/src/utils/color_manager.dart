// ignore_for_file: prefer_conditional_assignment, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instace = ColorManager._init();
  static ColorManager get instance {
    return _instace;
  }

  ColorManager._init();
  Color get primary => const Color(0xFF387DFF);
  Color get greyText => const Color(0xFFCBC4CF);
  Color get bgContainer => const Color(0xFFD8DBD1);
}
