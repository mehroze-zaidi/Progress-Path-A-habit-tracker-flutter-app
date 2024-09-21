import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/app/progress_path_app.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/splash/splash_screen_notifier.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_assets.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.progressPathSplashIcon,width: 200,height: 200,),
          10.verticalSpace,
          Text(
            "Create Good Habits and Break bad Habits with Progress Path",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
