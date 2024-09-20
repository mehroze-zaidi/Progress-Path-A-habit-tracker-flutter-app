import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/habit_creation_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/home_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/settings/settings_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/splash/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute { splash, home, habitCreation, settings }

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
                  ),
              routes: [
                GoRoute(
                    path: AppRoute.habitCreation.name,
                    name: AppRoute.habitCreation.name,
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const HabitCreationScreen(),
                        )),
                GoRoute(
                    path: AppRoute.settings.name,
                    name: AppRoute.settings.name,
                    pageBuilder: (context, state) => CustomTransitionPage(
                          child: const SettingsScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0); // Slide from right
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        )),
              ]),
        ]);
  },
);
