import 'package:flutter/material.dart';
import '../../core/models/models.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/styles.dart';
import '../wallet/presentation/screens/wallet_page.dart';

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  final List<BarItem> _navigationBarItems = <BarItem>[
    BarItem(
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      title: 'wallet',
      body: const WalletPage(),
    ),
    BarItem(
      icon: Icons.access_time_outlined,
      activeIcon: Icons.access_time_filled,
      title: 'history',
      body: const Text('history'),
    ),
    BarItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      title: 'settings',
      body: const Text('settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _getBackgroundColor(context),
      child: SafeArea(
        child: BWNavigationBar(
          items: _navigationBarItems,
        ),
      ),
    );
  }
}
