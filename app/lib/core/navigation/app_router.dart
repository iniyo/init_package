// app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:init_package/core/core.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    // 각 모듈의 네비게이션을 모음
    final List<AppNavigation> navigations = [
      HomeNavigation(),
      AuthNavigation(),
    ];

    // 각 모듈에서 제공한 경로를 통합
    final List<GoRoute> routes = navigations.expand((nav) => nav.getRoutes()).toList();

    // GoRouter 설정
    router = GoRouter(
      initialLocation: '/home',
      routes: routes,
    );
  }

  // 네비게이션 헬퍼 메서드: 홈으로 이동
  void goToHome(BuildContext context) {
    router.go('/home');
  }

  // 네비게이션 헬퍼 메서드: 로그인 페이지로 이동
  void goToLogin(BuildContext context) {
    router.go('/login');
  }
}
