import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/splash/splash_screen_notifier.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final splashScreenNotifierProvider =
    NotifierProvider<SplashScreenNotifier, bool>(
  () => SplashScreenNotifier(),
);

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashScreenNotifierProvider.notifier).startSplash();

    final hasNavigated = ref.watch(splashScreenNotifierProvider);
    if (hasNavigated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushReplacementNamed(AppRoute.home.name);
      });
    }
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}
