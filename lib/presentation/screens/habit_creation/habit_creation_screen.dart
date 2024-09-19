import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/habit.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/streak_goal_model.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/app_textfield.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/providers/habits_provider.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/widgets/completion_per_day_view.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/widgets/habit_colors_view.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/widgets/habit_icons_view.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/streak_goal/streak_goal_screen.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_assets.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


final selectedColorProvider = StateProvider((ref) {
  return 0xFFDC143C;
} ,);
final iconPathProvider = StateProvider((ref) {
  return AppAssets.light;
} ,);


final completionPerDayProvider = StateProvider((ref) {
  return 1;
} ,);


final streakGoalProvider = StateProvider((ref) {
  return StreakGoalModel();
} ,);


class HabitCreationScreen extends ConsumerStatefulWidget {
  const HabitCreationScreen({super.key});

  @override
  ConsumerState<HabitCreationScreen> createState() =>
      _HabitCreationScreenState();
}

class _HabitCreationScreenState extends ConsumerState<HabitCreationScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();




  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return ScreenBody(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.cancel,
                size: 24,
              )),
          title: Text(
            "Add New Habit",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.white,
                ),
          ),
          actions: [
            IconButton(
                onPressed: () {


                  ref.read(habitsProvider.notifier).state = [
                    ...ref.read(habitsProvider.notifier).state,
                    Habit(
                        title: titleController.text,
                        description: descController.text,
                        icon: ref.read(iconPathProvider),color:ref.read(selectedColorProvider),
                      perDayCompletions: ref.read(completionPerDayProvider),
                      streakGoal: ref.read(streakGoalProvider)
                    )
                  ];
                  context.pop();
                },
                icon: const Icon(
                  Icons.check_circle_rounded,
                  size: 30,
                ))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blackTxtColor,
                    ),
              ),
              5.verticalSpace,
              AppTextfield(
                controller: titleController,
              ),
              20.verticalSpace,
              Text(
                "Description",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blackTxtColor,
                    ),
              ),
              5.verticalSpace,
              AppTextfield(
                controller: descController,
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Streak Goal",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.blackTxtColor,
                                  ),
                        ),
                        5.verticalSpace,
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => const StreakGoalScreen(),
                            );
                          },
                          child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: AppColors.white)),
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "None",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: AppColors.whiteTxtColor,
                                          ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reminder",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.blackTxtColor,
                                  ),
                        ),
                        5.verticalSpace,
                        RoundedContainerWidget(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "None",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: AppColors.whiteTxtColor,
                                        ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              const CompletionPerDayView(),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Icon",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.blackTxtColor,
                        ),
                  ),
                  Text(
                    "see all",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.blackTxtColor,
                        ),
                  ),
                ],
              ),
              5.verticalSpace,
              const HabitIconsView(),
              20.verticalSpace,
              Text(
                "Color",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blackTxtColor,
                    ),
              ),
              5.verticalSpace,
              const HabitColorsView()
            ],
          ),
        ));
  }
}
