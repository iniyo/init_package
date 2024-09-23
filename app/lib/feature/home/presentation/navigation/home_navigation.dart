import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_package/core/core.dart';
import '../ui/screens/screens.dart';

class HomeNavigation implements AppNavigation {
  @override
  List<GoRoute> getRoutes() {
    return [
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomePage();
        },
        onExit: (context, state) {
          // ProviderScope의 context에서 ProviderContainer로 상태 관리
          final container = ProviderScope.containerOf(context);

          // backPressProvider의 상태를 읽음
          final canExit = container.read(backPressProvider.notifier).canExitApp();

          // 앱 종료 여부를 판단해 SnackBar 표시
          if (!canExit) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("'뒤로' 버튼을 한번 더 누르시면 종료됩니다."),
                duration: Duration(seconds: 2),
              ),
            );
          }

          return canExit; // true면 앱 종료 허용, false면 앱 종료 방지
        },
      ),
    ];
  }
}

// BackPressNotifier를 사용해 뒤로 가기 버튼 상태를 관리
class BackPressNotifier extends StateNotifier<DateTime?> {
  BackPressNotifier() : super(null);

  bool canExitApp() {
    final now = DateTime.now();
    if (state == null || now.difference(state!) > const Duration(seconds: 2)) {
      state = now;
      return false; // 뒤로 가기 동작을 막음
    }
    return true; // 뒤로 가기 동작을 허용
  }
}

// BackPressNotifier 상태를 관리하는 Provider
final backPressProvider = StateNotifierProvider<BackPressNotifier, DateTime?>(
      (ref) => BackPressNotifier(),
);
