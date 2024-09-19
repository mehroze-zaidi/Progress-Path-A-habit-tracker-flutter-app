import 'package:flutter/foundation.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/enums/streak_goal.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/models/streak_goal_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if User was not serializable, we could skip it.
part 'habit.g.dart';

@unfreezed
class Habit with _$Habit {
   factory Habit({
    required String title,
    String? description,
    String? icon,
    int? color,
    @Default(1)
    int perDayCompletions,
    @Default(StreakGoalModel())
    StreakGoalModel streakGoal,
    @Default([])
    List<DateTime> completionDates,



  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}