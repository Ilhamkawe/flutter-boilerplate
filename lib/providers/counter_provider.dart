import 'package:flutter_riverpod/legacy.dart';

final counterNotifierProvider =  StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());


class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}


final counterProvider = StateProvider<int>((ref) => 0);

