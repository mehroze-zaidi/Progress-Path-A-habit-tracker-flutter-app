import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();


final goRouterProvider=Provider<GoRouter>((ref) {
  return GoRouter(    initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,routes: [





      ]);
},);