import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/screens/habit_creation/notifiers/update_counter_notifier.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompletionPerDayView extends ConsumerWidget {
  const CompletionPerDayView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      "$counter/day",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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

                      onPressed: () {
                        ref.read(counterProvider.notifier).increaseCounter();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                    5.horizontalSpace,
                    IconButton(
                      onPressed: () {
                        ref.read(counterProvider.notifier).decreaseCounter();
                      },
                      icon: Icon(
                        Icons.remove,
                        color: counter == 1
                            ? AppColors.white.withOpacity(.5)
                            : AppColors.white,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
