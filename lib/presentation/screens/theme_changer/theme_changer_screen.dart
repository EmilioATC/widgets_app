import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/screens/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkmode = ref.watch( isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkmode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () => {
              ref.read(isDarkmodeProvider.notifier).state = !isDarkmode,
            },
          ),
        ],
        
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) { 

    final List<Color> colors = ref.watch(colorListProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        final int selectedColor = ref.watch(selectedColorProvider);
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          value: index,
          activeColor: color,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
