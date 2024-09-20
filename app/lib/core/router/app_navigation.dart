import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:init_package/feature/features.dart';

class AppRouter {
  late final GoRouter router;
  DateTime? currentBackPressTime;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomePage();
          },
          onExit: (context, state) {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
              currentBackPressTime = now;

              // SnackBar로 메시지 표시
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("'뒤로' 버튼을 한번 더 누르시면 종료됩니다."),
                  duration: Duration(seconds: 2),
                ),
              );
              return false; // 뒤로 가기 동작을 막음
            }
            return true; // 뒤로 가기 동작을 허용
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return const LoginScreen();
          },
        ),
        // 추가적인 경로는 여기에 추가
      ],
    );
  }
}
