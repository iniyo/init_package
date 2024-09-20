import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier를 사용해 상태 변경 로직을 캡슐화
class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0); // 초기 상태는 0으로 설정

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

// class CounterViewModel {
//   final StateProvider<int> counterProvider;
//
//   CounterViewModel(this.counterProvider);
//
//   void increment(WidgetRef ref) {
//     ref.read(counterProvider.notifier).state++;
//   }
//
//   void decrement(WidgetRef ref) {
//     ref.read(counterProvider.notifier).state--;
//   }
// }
