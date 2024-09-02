import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_package/core/theme.dart';
import 'package:init_package/navigation/app_navigation.dart';

// test 시 terminal에 입력
/// 전부 테스트
// flutter test
/// 개별 테스트
// flutter test test/providers_test.dart
// flutter test test/home_screen_test.dart

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key}); // AppRouter 인스턴스 생성

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // 시스템 테마에 따라 변경
      routerDelegate: _appRouter.router.routerDelegate,
      routeInformationParser: _appRouter.router.routeInformationParser,
      routeInformationProvider: _appRouter.router.routeInformationProvider,
    );
  }
}
