// login/navigation/login_navigation.dart
import 'package:go_router/go_router.dart';
import 'package:init_package/core/core.dart';

class AuthNavigation implements AppNavigation {
  @override
  List<GoRoute> getRoutes() {
    return [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
    ];
  }
}
