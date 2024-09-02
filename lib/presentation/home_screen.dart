import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);
    final count = ref.watch(counterViewModelProvider);
    final viewModel = ref.read(counterViewModelProvider.notifier);

    // FutureProvider의 상태를 구독하여 처리
    final asyncValue = ref.watch(futureDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greeting, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Text('Count: $count', style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            asyncValue.when(
              data: (data) => Text(data, style: const TextStyle(fontSize: 20)),
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
          ],
        ),
      ),
    );
  }
}
