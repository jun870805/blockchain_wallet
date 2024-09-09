import 'package:blockchain_wallet/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../../core/models/models.dart';

EdgeInsetsGeometry _kNavigationBarMargin = const EdgeInsets.symmetric(
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

class BWNavigationBar extends StatefulWidget {
  /// ## Navigation Bar (包含上方body view)
  ///
  /// ### Parameters:
  /// * **items**(List<BarItem>,***required***): 項目
  ///
  /// ### Example:
  /// ```dart
  /// BWNavigationBar(
  ///   items: [],
  /// );
  /// ```
  const BWNavigationBar({
    super.key,
    required this.items,
  });

  /// 項目
  final List<BarItem> items;

  @override
  State<BWNavigationBar> createState() => _BWNavigationBarState();
}

class _BWNavigationBarState extends State<BWNavigationBar> {
  int _selectedIndex = 0;

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: _getBackgroundColor(context),
      elevation: 0,
      items: widget.items
          .map((e) => BottomNavigationBarItem(
                icon: Icon(e.icon),
                activeIcon: e.activeIcon != null ? Icon(e.activeIcon!) : null,
                label: e.title,
              ))
          .toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: _getFocusColor(context),
      unselectedItemColor: _getUnfocusColor(context),
      onTap: (int index) => setState(() => _selectedIndex = index),
    );
  }

  Widget _buildBottomBody(BuildContext context) {
    return Container(
      margin: _kNavigationBarMargin,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: _kNavigationBarBorderRadius,
        boxShadow: _getNavigationBarBoxShadow(context),
      ),
      child: ClipRRect(
        borderRadius: _kNavigationBarBorderRadius,
        child: _buildBottomNavigationBar(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.items.elementAt(_selectedIndex).body,
      bottomNavigationBar: _buildBottomBody(context),
    );
  }
}
