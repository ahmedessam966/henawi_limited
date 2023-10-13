import 'package:flutter/material.dart';

extension Dimensions on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenRatio => MediaQuery.sizeOf(this).aspectRatio;
}
