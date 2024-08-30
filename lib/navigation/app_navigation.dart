import 'package:go_router/go_router.dart';
import 'package:init_package/presentation/home_screen.dart';
import 'package:init_package/presentation/login_screen.dart';


class AppRouter {
  final GoRouter router;

  AppRouter() : router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) => const LoginScreen(),
      ),
      // 추가적인 경로는 여기에 추가
    ],
  );
}
