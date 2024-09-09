import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/home_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/splash/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute { splash, home }

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
        initialLocation: '/',
        navigatorKey: rootNavigatorKey,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
              path: '/',
              name: AppRoute.splash.name,
              pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SplashScreen(),
                  )),
          GoRoute(
              path: '/home',
              name: AppRoute.home.name,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomeScreen(),
              )),
        ]);
  },
);
