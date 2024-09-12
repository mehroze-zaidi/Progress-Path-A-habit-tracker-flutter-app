import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/providers/habit_colors_provider.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final selectedColorIndexProvider=StateProvider<int>((ref) => 0,);
class HabitColorsView extends StatelessWidget {
  const HabitColorsView({super.key,this.onColorSelected});

  final Function(Color color)? onColorSelected;



  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {

       final selectedIndex =  ref.watch(selectedColorIndexProvider);
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ref.read(habitColorsProvider).length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9,mainAxisSpacing: 5,crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap:() {

                ref.read(selectedColorIndexProvider.notifier).state=index;
                onColorSelected?.call(ref.read(habitColorsProvider)[index]);
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ColoredBox(
                      color: ref.read(habitColorsProvider)[index]),
                  selectedIndex == index? Align(child: Container(width: 20,height: 20,color: AppColors.black,)):const SizedBox.shrink()
                ],
              ),
            );
          },
        );
      },

    );
  }
}
