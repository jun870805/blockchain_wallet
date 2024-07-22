import 'package:blockchain_wallet/core/utils/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final localeCode =
        SharedPreferencesUtil.instance.getString('locale') ?? 'en';
    state = Locale(localeCode);
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await SharedPreferencesUtil.instance
        .setString('locale', locale.languageCode);
  }
}
