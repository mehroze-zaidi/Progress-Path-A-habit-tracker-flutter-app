import 'package:flutter/material.dart';
import 'package:flutter_annual_task/flutter_annual_task.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/habit.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitTile extends ConsumerStatefulWidget {
  const HabitTile({super.key, this.onTaskComplete, required this.habit});

  final VoidCallback? onTaskComplete;

  final Habit habit;

  @override
  ConsumerState<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends ConsumerState<HabitTile> {
  late StateProvider<bool> taskMarkedProvider;

  // List<DateTime> completedDates=[];

  @override
  void initState() {
    // completedDates.clear();
    // completedDates.addAll(widget.habit.completionDates);
    taskMarkedProvider = StateProvider(
      (ref) {
        bool marked = false;
        for (var element in widget.habit.completionDates) {
          if (element.year == DateTime.now().year &&
              element.month == DateTime.now().month &&
              element.day == DateTime.now().day) {
            marked = true;
          }
        }

        return marked;
      },
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HabitTile oldWidget) {
    if (oldWidget != widget) {
      taskMarkedProvider = StateProvider(
        (ref) {
          bool marked = false;
          for (var element in widget.habit.completionDates) {
            if (element.year == DateTime.now().year &&
                element.month == DateTime.now().month &&
                element.day == DateTime.now().day) {
              marked = true;
            }
          }

          return marked;
        },
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = ref.watch(taskMarkedProvider);

    return RoundedContainerWidget(
        color: AppColors.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  RoundedContainerWidget(
                    width: 50,
                    height: 50,
                    color: Color(widget.habit.color ?? Colors.black.value)
                        .withAlpha(80),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        widget.habit.icon!,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.habit.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white, height: 1),
                      ),
                      Text(
                        widget.habit.description ?? "",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      //isSelected: taskCompletedNotifier.isCompleted,
                      visualDensity:
                          const VisualDensity(vertical: -2, horizontal: -2),
                      iconSize: 24,
                      padding: EdgeInsets.zero,
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: WidgetStatePropertyAll(isCompleted
                              ? Color(widget.habit.color ?? Colors.amber.value)
                              : AppColors.lightSurfaceColor)),
                      onPressed: () {
                        List<DateTime> tempList =
                            List.from(widget.habit.completionDates);
                        if (isCompleted) {
                          tempList.removeLast();
                        } else {
                          tempList.add(DateTime.now());
                        }

                        widget.habit.completionDates = tempList;
                        ref.read(taskMarkedProvider.notifier).state =
                            !isCompleted;
                        widget.onTaskComplete?.call();
                      },
                      icon: const Icon(Icons.check, color: AppColors.white),
                    ),
                  )
                ],
              ),
              10.verticalSpace,
              AnnualTaskView(
                spacing: 2,
                showMonthLabel: false,
                showWeekDayLabel: false,
                swipeEnabled: true,
                cellWidthFactor: 1.3,
                emptyColor: Color(widget.habit.color ?? Colors.black26.value)
                    .withAlpha(70),
                activateColor: Color(widget.habit.color ?? Colors.amber.value),
                cellShape: AnnualTaskCellShape.ROUNDED_SQUARE,
                List.generate(
                  widget.habit.completionDates.length,
                  (index) {
                    return AnnualTaskItem(widget.habit.completionDates[index]);
                  },
                ),
                firstDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day),
              ),
            ],
          ),
        ));
  }
}
