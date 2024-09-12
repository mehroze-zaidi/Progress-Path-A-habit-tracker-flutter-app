import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/providers/habit_icons_provider.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIconIndexProvider = StateProvider<int>(
  (ref) => 0,
);

class HabitIconsView extends StatelessWidget {
  const HabitIconsView({super.key, this.onColorSelected});

  final Function(Color color)? onColorSelected;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {

        final selectedIndex = ref.watch(selectedIconIndexProvider);
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 21,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(

                borderRadius: BorderRadius.circular(5),
                customBorder:Border.all(color: AppColors.white, width: 2),

                onTap: () {
                  ref.read(selectedIconIndexProvider.notifier).state = index;
                },
                child: RoundedContainerWidget(
                  color: Colors.transparent,
                  showBorder:  selectedIndex == index,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      ref.read(habitIconsProvider)[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
