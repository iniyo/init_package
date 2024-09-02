import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_package/presentation/viewmodels/counter_viewmodel.dart';

// StateProvider로 기본적인 상태 관리
final counterProvider = StateProvider<int>((ref) => 0);

// 예시용 Provider: 간단한 문자열 제공
final greetingProvider = Provider<String>((ref) => "Hello World!");

final titleProvider = StateProvider<String>((ref) => 'Home Screen');

// StateNotifierProvider로 더 복잡한 상태 관리
final counterViewModelProvider = StateNotifierProvider<CounterViewModel, int>(
      (ref) => CounterViewModel(),
);

// FutureProvider를 사용해 비동기 데이터를 가져오는 예제
final futureDataProvider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 2)); // 비동기 작업 시뮬레이션
  return "Fetched Complete!";
});