import 'package:blockchain_wallet/shared/styles/styles.dart';
import 'package:flutter/material.dart';

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
  const BWNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
  });

  /// 選項
  final List<NavigationBarItem> items;

  /// 選中的選項id
  final int selectedIndex;

  /// 回傳選中的選項index
  final Function(int) onChanged;

  @override
  State<BWNavigationBar> createState() => _BWNavigationBarState();
}

class _BWNavigationBarState extends State<BWNavigationBar> {
  Widget _buildBody(BuildContext context) {
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
      currentIndex: widget.selectedIndex,
      selectedItemColor: _getFocusColor(context),
      unselectedItemColor: _getUnfocusColor(context),
      onTap: widget.onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _kNavigationBarMargin,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: _kNavigationBarBorderRadius,
        boxShadow: _getNavigationBarBoxShadow(context),
      ),
      child: ClipRRect(
        borderRadius: _kNavigationBarBorderRadius,
        child: _buildBody(context),
      ),
    );
  }
}

class NavigationBarItem {
  NavigationBarItem({
    required this.icon,
    this.activeIcon,
    this.title,
    required this.body,
  });

  /// icon(必填)
  final IconData icon;

  /// 圖片
  final IconData? activeIcon;

  /// 標題
  final String? title;

  /// body(必填)
  final Widget body;
}
