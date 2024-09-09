import 'package:flutter/material.dart';
import 'package:flutter_annual_task/flutter_annual_task.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitTile extends ConsumerWidget {
  const HabitTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RoundedContainerWidget(
        color: AppColors.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  RoundedContainerWidget(
                    color: AppColors.lightSurfaceColor,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.directions_walk,
                        size: 24,
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Work Out",

                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.white,
                              height: 1
                                ),
                      ),
                      Text(
                        "I need to work out daily",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    visualDensity: VisualDensity(vertical: -2,horizontal: -2),
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                      style: ButtonStyle(
                          shape:
                              const WidgetStatePropertyAll(RoundedRectangleBorder(side: BorderSide(color: AppColors.white))),
                          backgroundColor: WidgetStatePropertyAll(
                              AppColors.lightSurfaceColor)),
                      onPressed: () {},
                      icon: const Icon(Icons.check))
                ],
              ),
              10.verticalSpace,
              AnnualTaskView(
                spacing: 2,
                  // showMonthLabel: true,
                  // showWeekDayLabel: true,
                  swipeEnabled: true,
                  cellWidthFactor: 1.5,
                  activateColor: AppColors.errorColor,
                  cellShape: AnnualTaskCellShape.ROUNDED_SQUARE,

                  [AnnualTaskItem(DateTime.now())]),
            ],
          ),
        ));
  }
}
