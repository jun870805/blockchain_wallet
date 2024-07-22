import 'package:blockchain_wallet/core/utils/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.light) {
    _loadThemeMode();
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
  }

  Future<void> _loadThemeMode() async {
    final isThemeModeLight =
        SharedPreferencesUtil.instance.getBool('isThemeModeLight') ?? true;
    state = isThemeModeLight ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> setLocale(ThemeMode mode) async {
    state = mode;
    await SharedPreferencesUtil.instance.setBool(
      'locale',
      mode == ThemeMode.light,
    );
  }
}
