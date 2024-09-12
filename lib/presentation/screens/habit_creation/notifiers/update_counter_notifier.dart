import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateCounterNotifier extends Notifier<int> {
  int counter = 1;

  @override
  int build() => counter;


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


 final counterProvider=NotifierProvider<UpdateCounterNotifier,int>(() => UpdateCounterNotifier(),);
