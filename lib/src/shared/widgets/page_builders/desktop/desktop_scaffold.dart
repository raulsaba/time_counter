import 'package:flutter/material.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double drawerSize = 300;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: drawerSize,
              height: MediaQuery.of(context).size.height,
              // child: const DesktopMenu(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - drawerSize,
              height: MediaQuery.of(context).size.height,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
