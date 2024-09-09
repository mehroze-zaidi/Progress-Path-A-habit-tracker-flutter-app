import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenNotifier extends Notifier<bool> {
  @override
  build() {
    return false;
  }


  Future<void> startSplash() async {
    // Simulate a delay for the splash screen
    await Future.delayed(const Duration(seconds: 3));
    state = true; // Change state to indicate navigation should occur
  }


}



