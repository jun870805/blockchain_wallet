import 'package:blockchain_wallet/core/providers/locale_provider.dart';
import 'package:blockchain_wallet/core/providers/theme_provider.dart';
import 'package:blockchain_wallet/features/navigation/navigation.dart';
import 'package:blockchain_wallet/generated/l10n.dart';
import 'package:blockchain_wallet/shared/styles/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
      ).copyWith(
        extensions: <ThemeExtension<BWThemeData>>[
          const BWThemeData(
            color: BWColor.bright(),
            shadow: BWShadow.bright(),
            typography: BWTypography(),
          ),
        ],
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
      ).copyWith(
        extensions: <ThemeExtension<BWThemeData>>[
          const BWThemeData(
            color: BWColor.dark(),
            shadow: BWShadow.dark(),
            typography: BWTypography(),
          ),
        ],
      ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: "isInitialRoute",
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: locale,
      home: NavigationPage(),
    );
  }
}
