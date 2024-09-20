import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/navigation/app_router.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:go_router/go_router.dart';

class NoHabitView extends StatelessWidget {
  const NoHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        const Icon(Icons.add_box,size: 34,),
        10.verticalSpace,
        Text(
          "You have no habit",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.blackTxtColor,),
        ),
        5.verticalSpace,
        Text(
          "Take first step to improve your life, Create Habit and Track it!",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.blackTxtColor,),
        ),
        OutlinedButton(onPressed: () {
          context.goNamed(AppRoute.habitCreation.name);

        }, child:   Text(
          "Add new Habit",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.blackTxtColor,),
        ),)

      ],),
    );
  }
}
