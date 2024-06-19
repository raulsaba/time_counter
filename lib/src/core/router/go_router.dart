import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/calculator/page/calculator_page.dart';
import '../../features/config/config_container.dart';
import '../../shared/widgets/page_builders/app_scaffold.dart';
import '../logger.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.intialRoute,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppScaffold(
          currentLocation: state.matchedLocation,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.intialRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: WorkingTimePage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.configRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ConfigContainer(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.intialRoute,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AppScaffold(
          currentLocation: AppRoutes.intialRoute,
          child: WorkingTimePage(),
        ),
      ),
    ),
  ],
  observers: [
    GoRouterObserver(),
  ],
);

class AppRoutes {
  static const String intialRoute = '/';
  static const String configRoute = '/config';
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.white.log('MyTest didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.white.log('MyTest didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.white.log('MyTest didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    Logger.white.log('MyTest didReplace: $newRoute');
  }
}
