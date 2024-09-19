import 'package:flutter_new_project_template_with_riverpod/domain/models/habit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Habit> habits=[];

final habitsProvider = StateProvider<List<Habit>>(
      (ref) {
    return habits;
  },
);