import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/app_textfield.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/widgets/habit_colors_view.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:go_router/go_router.dart';

class HabitCreationScreen extends StatefulWidget {
  const HabitCreationScreen({super.key});

  @override
  State<HabitCreationScreen> createState() => _HabitCreationScreenState();
}

class _HabitCreationScreenState extends State<HabitCreationScreen> {
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
              const AppTextfield(),
              20.verticalSpace,
              Text(
                "Description",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blackTxtColor,
                    ),
              ),
              5.verticalSpace,
              const AppTextfield(),
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
              Text(
                "Completion Per Day",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blackTxtColor,
                    ),
              ),
              5.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: RoundedContainerWidget(
                        height: 42,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "1/day",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.whiteTxtColor,
                                    ),
                          ),
                        )),
                  ),
                  10.horizontalSpace,
                  RoundedContainerWidget(
                      height: 42,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          5.horizontalSpace,
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
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
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 21,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7),
                itemBuilder: (context, index) {
                  return IconButton(onPressed: () {}, icon: Icon(Icons.alarm));
                },
              ),

              20.verticalSpace,
              Text(
                "Color",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackTxtColor,
                ),
              ),
              5.verticalSpace,

              HabitColorsView()







            ],
          ),
        ));
  }
}
