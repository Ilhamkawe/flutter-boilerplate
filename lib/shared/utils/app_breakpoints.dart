import 'package:flutter/material.dart';
import 'package:warehouse_app/constants/breakpoint.dart';

class AppBreakPoint {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < BreakpointConst.mobile;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= BreakpointConst.mobile &&
        MediaQuery.of(context).size.width < BreakpointConst.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= BreakpointConst.tablet;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
