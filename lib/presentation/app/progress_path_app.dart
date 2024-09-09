import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

final loggerProvider = Provider<Logger>(
  (ref) => Logger(),
);

class ProgressPathApp extends ConsumerWidget {
  const ProgressPathApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
          title: 'Progress Path',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) => child ?? const SizedBox())
              ],
            );
          },
        );
      },
    );
  }
}
