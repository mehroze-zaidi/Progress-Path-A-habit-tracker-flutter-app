import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/setting_item.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/rounded_container_widget.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/common_widgets/screen_body.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_assets.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/extensions/space.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  final List<SettingItem> appSettingItems = const [
    SettingItem(AppAssets.apple, "General"),
    SettingItem(AppAssets.apple, "Theme"),
    SettingItem(AppAssets.apple, "Archived Habits"),
    SettingItem(AppAssets.apple, "Data Import/Export"),
    SettingItem(AppAssets.apple, "Reorder Habits"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.cancel)),
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackTxtColor,
              ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedContainerWidget(
              showBorder: false,
              borderRadius: 6,
            color: AppColors.lightSurfaceColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.adb,
                      size: 34,
                    ),
                    20.horizontalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subscribe to Progress Path Pro",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: AppColors.blackTxtColor,
                              ),
                        ),
                        Text(
                          "Unlimited Habit, Import/Export Data",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: AppColors.blackTxtColor,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              "App",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.blackTxtColor  ,
                  ),
            ),
            5.verticalSpace,
            RoundedContainerWidget(
              showBorder: false,
              borderRadius: 6,
              color: AppColors.lightSurfaceColor,
              child: ListView.separated(padding:
                  EdgeInsets.zero,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  trailing: Icon(Icons.arrow_forward_ios,size: 14,),

                  visualDensity: VisualDensity(vertical: -3),
                  title: Text(
                    appSettingItems[index].title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.blackTxtColor,
                    ),
                  ),
                );
              }, separatorBuilder:(context, index) =>  Divider(height: 0,), itemCount: appSettingItems.length),
            )
          ],
        ),
      ),
    );
  }
}
