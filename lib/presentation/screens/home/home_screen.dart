import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/habit.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/providers/habits_provider.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_detail/habit_detail_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/widgets/habit_tile.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/widgets/no_habit_view.dart';
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



  @override
  Widget build(BuildContext context) {
    final  List<Habit> habits = ref.watch<List<Habit>>(habitsProvider);
    return ScreenBody(
        appBar: AppBar(
          leading:IconButton(
              onPressed: () {
                context.goNamed(AppRoute.settings.name);
              },
              icon: const Icon(Icons.settings,size: 28,)),
          title: Text(
            "Progress Path: A Habit Tracker",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.white,
                ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.goNamed(AppRoute.habitCreation.name);
                },
                icon: const Icon(Icons.bar_chart,size: 28,)),
            IconButton(
                onPressed: () {
                  context.goNamed(AppRoute.habitCreation.name);
                },
                icon: const Icon(Icons.add_box_outlined,size: 28,))
          ],
        ),
        enableScroll: false,
        child: ref.read(habitsProvider).isEmpty?const NoHabitView(): ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return GestureDetector(
              onTap: () {
                showFullScreenGeneralDialog(context, ref.read(habitsProvider)[index]);
                

                // showDialog(context: context, builder:(context) =>  Dialog(backgroundColor: Colors.transparent,child: HabitDetailScreen(habit: ref.read(habitsProvider)[index],),));
              },
              child: HabitTile(
                    habit: ref.read(habitsProvider)[index],
                    onTaskComplete: () {
                      // selectedIndex=index;
                      // ref.read(taskCompletionStatusProvider.notifier).toggleCompletion();
                    },
                  ),
            );
            },
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: ref.read(habitsProvider).length));
  }

  void showFullScreenGeneralDialog(BuildContext context,Habit habit) async {
   await showGeneralDialog(

      context: context,
      barrierDismissible: true, // Dismiss by tapping outside
      barrierLabel: "Full Screen Dialog",

      pageBuilder: (context, anim1, anim2) {
        return Container(); // Required but not used since we handle transitionBuilder
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return Center(
          child: Transform.scale(

            scale: anim1.value,
            child: Opacity(
              opacity: anim1.value,
              child: HabitDetailScreen(habit: habit,)
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),

    );
   setState(() {

   });
  }
}
