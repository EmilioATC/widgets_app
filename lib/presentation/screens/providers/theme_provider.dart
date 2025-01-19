// Estado => isDarkmodeProvider = boolean
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Un simple boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => true);

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);
