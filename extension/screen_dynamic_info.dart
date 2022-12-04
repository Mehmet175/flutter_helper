import 'package:flutter/material.dart';

extension ScreenDynamicInfo on BuildContext {
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
}
