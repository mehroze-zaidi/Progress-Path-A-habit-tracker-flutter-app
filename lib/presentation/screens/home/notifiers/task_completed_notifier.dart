import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCompletedNotifier extends Notifier<bool>{


  bool  isCompleted=false;


  toggleCompletion(){

    isCompleted  = !isCompleted;
    state=isCompleted;

  }

  @override
  bool build() {
    return false;
  }



}

final taskCompletionStatusProvider=NotifierProvider<TaskCompletedNotifier,bool>(() => TaskCompletedNotifier(),);