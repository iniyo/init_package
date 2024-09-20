import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_package/feature/ProjectApplication.dart';
import 'package:init_package/core/utils/riverpod_observer.dart';

// test 시 terminal에 입력
/// 전부 테스트
// flutter test
/// 개별 테스트
// flutter test test/providers_test.dart
// flutter test test/home_screen_test.dart

void main() {
  runApp(
      ProviderScope(
          observers: [RiverpodObserver()],
          child: MyApp()
      )
  );
}

