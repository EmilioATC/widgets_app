import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/screens/providers/counter_provider.dart';
import 'package:widgets_app/presentation/screens/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch( isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkmode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () => {
              ref.read(isDarkmodeProvider.notifier).state = !isDarkmode,
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor: $counter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
