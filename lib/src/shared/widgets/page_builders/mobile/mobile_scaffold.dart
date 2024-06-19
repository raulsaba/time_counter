import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:time_counter/src/core/router/go_router.dart';
import 'package:time_counter/src/shared/widgets/buttons/theme_button.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({
    super.key,
    required this.child,
    required this.currentLocation,
  });

  final Widget child;
  final String currentLocation;

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  int _currentIndex = 0;

  @override
  void initState() {
    switch (widget.currentLocation) {
      case AppRoutes.intialRoute:
        _currentIndex = 0;
        break;
      case AppRoutes.configRoute:
        _currentIndex = 1;
        break;
    }
    super.initState();
  }

  List<_MyCustomBottomNavBarItem> tabs = [
    const _MyCustomBottomNavBarItem(
      icon: Icon(
        Symbols.timer,
        fill: 0,
      ),
      activeIcon: Icon(
        Symbols.timer,
        fill: 1,
      ),
      label: 'Calculadora',
      initialLocation: AppRoutes.intialRoute,
    ),
    const _MyCustomBottomNavBarItem(
      icon: Icon(
        Symbols.settings,
        fill: 0,
      ),
      activeIcon: Icon(
        Symbols.settings,
        fill: 1,
      ),
      label: 'Configurações',
      initialLocation: AppRoutes.configRoute,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Horas de Trabalho"),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 12,
        unselectedItemColor: Theme.of(context).disabledColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _goOtherTab(context, index, tabs[index].initialLocation);
        },
        currentIndex: _currentIndex,
        items: tabs,
      ),
    );
  }

  void _goOtherTab(BuildContext context, int index, String location) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
      context.go(location);
    });
  }
}

class _MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const _MyCustomBottomNavBarItem({
    required this.initialLocation,
    required super.icon,
    super.label,
    Widget? activeIcon,
  }) : super(
          activeIcon: activeIcon ?? icon,
        );
}
