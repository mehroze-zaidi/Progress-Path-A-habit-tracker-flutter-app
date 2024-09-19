import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/habit.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/app/progress_path_app.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/home/widgets/habit_tile.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';

class HabitDetailScreen extends StatelessWidget {
  const HabitDetailScreen({super.key, required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundedContainerWidget(borderRadius:8,height: 40,showBorder: false,color: Color(habit.color ?? AppColors.primaryColor.value)
                    .withAlpha(60), child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Completions Per Day:",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blackTxtColor,),
                          ),
                          Text(
                                        habit.perDayCompletions.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: AppColors.blackTxtColor,),
                                      ),
                        ],
                      ),
                    ),),
                10.horizontalSpace,
                RoundedContainerWidget(borderRadius: 8,height: 40,showBorder: false,color: Color(habit.color ?? AppColors.primaryColor.value)
                    .withAlpha(60), child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.local_fire_department_sharp),
                      Text(
                        habit.perDayCompletions.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.blackTxtColor,),
                      ),
                    ],
                  ),
                ),),
              ],
            ),

10.verticalSpace,

            HabitTile(habit: habit),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.calendar_month_rounded)),

              IconButton(onPressed: () {

              }, icon: Icon(Icons.edit)),

              IconButton(onPressed: () {

              }, icon: Icon(Icons.delete)),

              IconButton(onPressed: () {

              }, icon: Icon(Icons.share)),
            ],)

          ],
        ),
      ),
    );
  }
}
