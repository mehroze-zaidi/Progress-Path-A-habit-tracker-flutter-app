import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/enums/streak_goal.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/streak_goal_model.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/habit_creation_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/streak_goal/notifiers/update_counter_notifier.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/streak_goal/widgets/completion_per_interval_view.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>(
  (ref) => 0,
);

class StreakGoalScreen extends ConsumerWidget {
  const StreakGoalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      StreakGoal.none,
      StreakGoal.daily,
      StreakGoal.week,
      StreakGoal.month,
    ];

    return ScreenBody(
        appBar: AppBar(
          title: Text(
            "Streak Goal",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blackTxtColor,
                ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              int selectedIndex = ref.watch(selectedIndexProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Interval",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.blackTxtColor,
                        ),
                  ),
                  10.verticalSpace,
                  Ink(
                    decoration: BoxDecoration(
                      color: AppColors.lightSurfaceColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            ref.read(selectedIndexProvider.notifier).state =
                                index;

                            ref.read(streakGoalProvider.notifier).state =
                                StreakGoalModel(
                                    streakGoal: items[index],
                                    perDayCompletions: ref.read(
                                        streakIntervalUpdateCounterProvider));
                          },
                          trailing: selectedIndex == index
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.blackTxtColor,
                                )
                              : null,
                          visualDensity: const VisualDensity(vertical: -3),
                          // contentPadding: EdgeInsets.zero,

                          title: Text(
                            getStreakGoalDisplayName(items[index]),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.blackTxtColor,
                                    ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 0,
                        );
                      },
                    ),
                  ),
                  10.verticalSpace,
                  items[selectedIndex] == StreakGoal.week ||
                          items[selectedIndex] == StreakGoal.month
                      ? CompletionPerIntervalView(
                          interval: items[selectedIndex],
                        )
                      : const SizedBox.shrink()
                ],
              );
            },
          ),
        ));
  }

  String getStreakGoalDisplayName(StreakGoal streakGoal) {
    switch (streakGoal) {
      case StreakGoal.none:
        return 'None';

      case StreakGoal.daily:
        return 'Daily';
      case StreakGoal.week:
        return 'Week';
      case StreakGoal.month:
        return 'Month';
    }
  }
}
