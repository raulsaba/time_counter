import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppPageBuilder extends StatelessWidget {
  const AppPageBuilder({
    super.key,
    required this.desktopChild,
    required this.mobileChild,
  });

  final Widget Function(BuildContext context, BoxConstraints constraints) desktopChild;
  final Widget Function(BuildContext context, BoxConstraints constraints) mobileChild;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveBreakpoints.of(context).isMobile) {
          return mobileChild(context, constraints);
        } else {
          return desktopChild(context, constraints);
        }
      },
    );
  }
}
