import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_package/core/navigation/app_router.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});
