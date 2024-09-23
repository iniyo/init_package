import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init_package/core/core.dart';
import '../../viewmodels/providers.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);
    final count = ref.watch(counterViewModelProvider);
    final viewModel = ref.read(counterViewModelProvider.notifier);
    final appRouter = ref.read(appRouterProvider); // AppRouter 의존성 주입

    // FutureProvider의 상태를 구독하여 처리
    final asyncValue = ref.watch(futureDataProvider);
    return BaseLayout(
      title: "HomePage",
      widgets: [
        Text(
          greeting,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Text(
          'Count: $count',
          style: const TextStyle(fontSize: 40),
        ),
        const SizedBox(height: 20),
        asyncValue.when(
          data: (data) => Text(
            data,
            style: const TextStyle(fontSize: 20),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: viewModel.increment,
              child: const Text('Increment'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: viewModel.decrement,
              child: const Text('Decrement'),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // use go router
            // context.go('/login'); // 사용 시 navigation stack을 새로 생성.
            appRouter.goToHome(context);
          },
          child: const Text('toLogin'),
        )
      ],
    );
  }
}
