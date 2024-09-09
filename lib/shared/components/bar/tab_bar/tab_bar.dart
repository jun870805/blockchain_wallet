import 'package:blockchain_wallet/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/models.dart';

const double kTabBarHeight = 40.0;

const double _kTabButtonIconSize = 16.0;

const double _kDividerHeight = 3;

const EdgeInsets _kTabButtonIconPadding = EdgeInsets.only(
  top: 1,
);

const BorderRadius _kDividerBorderRadius = BorderRadius.all(
  Radius.circular(100.0),
);

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

Color _getTabButtonIconColor(BuildContext context, bool isSelected) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return isSelected ? themeData.color.primary : themeData.color.title;
}

Color _getDividerColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.primary;
}

List<BoxShadow> _getTabBarRowShadow(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.shadow.extraLightOnlyBottom;
}

TextStyle _getTabButtonTitleTextStyle(BuildContext context, bool isSelected) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  if (isSelected) {
    return themeData.typography.titleSmallBold.apply(
      color: themeData.color.primary,
    );
  } else {
    return themeData.typography.titleSmallRegular.apply(
      color: themeData.color.title,
    );
  }
}

class BWTabBar extends StatelessWidget {
  /// ## Tab Bar
  ///
  /// ### Parameters:
  /// * **items**(List<BarItem>,***required***): 項目
  /// * **controller**(TabController,***required***): tab控制器
  ///
  /// ### Example:
  /// ```dart
  /// BWTabBar(
  ///   items: [],
  ///   controller: TabController(),
  /// );
  /// ```
  const BWTabBar({
    super.key,
    required this.items,
    required this.controller,
  });

  /// 項目
  final List<BarItem> items;

  /// 控制器
  final TabController controller;

  Widget _buildTabButtonIcon(BuildContext context, int index) {
    bool isSelected = index == controller.index;
    IconData icon = items[index].icon!;
    if (isSelected && items[index].activeIcon != null) {
      icon = items[index].activeIcon!;
    }

    return Padding(
      padding: _kTabButtonIconPadding,
      child: Icon(
        icon,
        size: _kTabButtonIconSize,
        color: _getTabButtonIconColor(context, isSelected),
      ),
    );
  }

  Widget _buildTabButtonTitle(BuildContext context, int index) {
    bool isSelected = index == controller.index;

    return Text(
      items[index].title!,
      style: _getTabButtonTitleTextStyle(context, isSelected),
    );
  }

  Widget _buildTabButton(BuildContext context, int index) {
    List<Widget> children = [];

    if (items[index].icon != null) {
      children.add(_buildTabButtonIcon(context, index));
      children.add(const SizedBox(width: 4));
    }
    if (items[index].title != null) {
      children.add(_buildTabButtonTitle(context, index));
    }

    return GestureDetector(
      onTap: () => controller.animateTo(index),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: _kDividerHeight,
      decoration: BoxDecoration(
        color: _getDividerColor(context),
        borderRadius: _kDividerBorderRadius,
      ),
    );
  }

  Widget _buildTabBarItem(BuildContext context, int index) {
    bool isSelected = index == controller.index;

    List<Widget> children = [];

    children.add(_buildTabButton(context, index));
    if (isSelected) {
      children.add(const SizedBox(height: 4));
      children.add(_buildDivider(context));
    }

    return IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTabBarHeight,
      width: double.infinity,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        boxShadow: _getTabBarRowShadow(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          items.length,
          (index) => _buildTabBarItem(context, index),
        ),
      ),
    );
  }
}
