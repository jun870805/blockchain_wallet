import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/styles.dart';
import '../wallet/presentation/screens/wallet_page.dart';

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<NavigationBarItem> _navigationBarItems = <NavigationBarItem>[
    NavigationBarItem(
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      title: 'wallet',
      body: const WalletPage(),
    ),
    NavigationBarItem(
      icon: Icons.access_time_outlined,
      activeIcon: Icons.access_time_filled,
      title: 'history',
      body: const Text('history'),
    ),
    NavigationBarItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      title: 'settings',
      body: const Text('settings'),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _getBackgroundColor(context),
      child: SafeArea(
        child: Scaffold(
          body: _navigationBarItems.elementAt(_selectedIndex).body,
          bottomNavigationBar: BWNavigationBar(
            items: _navigationBarItems,
            selectedIndex: _selectedIndex,
            onChanged: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
