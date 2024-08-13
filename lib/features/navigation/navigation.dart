import 'package:blockchain_wallet/features/wallet/presentation/screens/wallet_page.dart';
import 'package:blockchain_wallet/shared/styles/styles.dart';
import 'package:flutter/material.dart';

EdgeInsetsGeometry _kNavigationBarPadding = const EdgeInsets.symmetric(
  vertical: 8.0,
  horizontal: 16.0,
);

BorderRadius _kNavigationBarBorderRadius = BorderRadius.circular(30.0);

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

Color _getFocusColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.primary;
}

Color _getUnfocusColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.title;
}

List<BoxShadow> _getNavigationBarBoxShadow(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.shadow.light;
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    WalletPage(),
    Text('history'),
    Text('settings'),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getBackgroundColor(context),
      child: SafeArea(
        child: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: Padding(
            padding: _kNavigationBarPadding,
            child: Container(
              decoration: BoxDecoration(
                color: _getBackgroundColor(context),
                borderRadius: _kNavigationBarBorderRadius,
                boxShadow: _getNavigationBarBoxShadow(context),
              ),
              child: ClipRRect(
                borderRadius: _kNavigationBarBorderRadius,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: _getBackgroundColor(context),
                  elevation: 0,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_balance_wallet_outlined),
                      activeIcon: Icon(Icons.account_balance_wallet),
                      label: 'wallet',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.access_time_outlined),
                      activeIcon: Icon(Icons.access_time_filled),
                      label: 'history',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      activeIcon: Icon(Icons.settings),
                      label: 'settings',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: _getFocusColor(context),
                  unselectedItemColor: _getUnfocusColor(context),
                  onTap: _onItemTapped,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
