import 'package:flutter/foundation.dart';
import 'package:flutter_new_project_template_with_riverpod/domain/enums/streak_goal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_goal_model.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if User was not serializable, we could skip it.
part 'streak_goal_model.g.dart';

@freezed
class StreakGoalModel with _$StreakGoalModel {
  const factory StreakGoalModel({
    @Default(StreakGoal.none)
    StreakGoal streakGoal,

    @Default(0)
    int perDayCompletions



  }) = _StreakGoalModel;

  factory StreakGoalModel.fromJson(Map<String, dynamic> json) => _$StreakGoalModelFromJson(json);
}