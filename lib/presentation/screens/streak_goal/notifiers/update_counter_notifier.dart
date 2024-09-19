import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreakIntervalUpdateCounterNotifier extends Notifier<int> {
  int counter = 1;

  @override
  int build() {
    return counter=Random().nextInt(10);
  }


  increaseCounter(){
    if(counter < 100){

    counter ++;
    state=counter;
    }

  }


  decreaseCounter(){

    if(counter > 1){

      counter --;
      state=counter;
    }
  }

}


 final streakIntervalUpdateCounterProvider=NotifierProvider<StreakIntervalUpdateCounterNotifier,int>(() => StreakIntervalUpdateCounterNotifier(),);
