import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/widgets/habit_tile.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenBody(
        appBar: AppBar(
          title: Text(
            "Progress Path: A Habit Tracker",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.white,
                ),
          ),
        ),
        enableScroll: false,
        child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => const HabitTile(),
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: 10));
  }
}
