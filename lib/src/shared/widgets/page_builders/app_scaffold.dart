import 'package:flutter/material.dart';

import 'mobile/mobile_scaffold.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    required this.currentLocation,
  });

  final Widget child;
  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    // if (ResponsiveBreakpoints.of(context).isMobile) {
    return MobileScaffold(
      currentLocation: currentLocation,
      child: child,
    );
    // }
    // return DesktopScaffold(child: child);
  }
}
