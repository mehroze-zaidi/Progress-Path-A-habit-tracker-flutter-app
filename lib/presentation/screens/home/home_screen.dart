import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/notifiers/task_completed_notifier.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/widgets/habit_tile.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
   const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {

    final  bool isTaskCompleted = ref.watch(taskCompletionStatusProvider);
    return ScreenBody(
        appBar: AppBar(
          title: Text(
            "Progress Path: A Habit Tracker",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.white,
                ),
          ),
          actions: [IconButton(onPressed: () {
            context.goNamed(AppRoute.habitCreation.name);

          }, icon: const Icon(Icons.add_box_outlined))],
        ),
        enableScroll: false,
        child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) =>  HabitTile(onTaskComplete: () {
              selectedIndex=index;
              ref.read(taskCompletionStatusProvider.notifier).toggleCompletion();
            },completed:selectedIndex==index ,),
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: 10));
  }
}
