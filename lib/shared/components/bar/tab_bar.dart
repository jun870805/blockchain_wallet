import 'package:blockchain_wallet/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../../core/models/models.dart';

const double _kTabHeight = 40.0;

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

  return themeData.shadow.extraLight;
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

class BWTabBar extends StatefulWidget {
  /// ## Tab Bar (包含下方body view)
  ///
  /// ### Parameters:
  /// * **items**(List<NavigationBarItem>,***required***): 項目
  ///
  /// ### Example:
  /// ```dart
  /// BWTabBar(
  ///   items: [],;
  ///   }
  /// );
  /// ```
  const BWTabBar({
    super.key,
    required this.items,
  });

  /// 項目
  final List<BarItem> items;

  @override
  State<BWTabBar> createState() => _BWTabBarState();
}

class _BWTabBarState extends State<BWTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.items.length,
      vsync: this,
    );
    _tabController?.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _tabController?.removeListener(() => setState(() {}));

    super.dispose();
  }

  Widget _buildTabButtonIcon(BuildContext context, int index) {
    bool isSelected = index == _tabController?.index;
    IconData icon = widget.items[index].icon!;
    if (isSelected && widget.items[index].activeIcon != null) {
      icon = widget.items[index].activeIcon!;
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
    bool isSelected = index == _tabController?.index;

    return Text(
      widget.items[index].title!,
      style: _getTabButtonTitleTextStyle(context, isSelected),
    );
  }

  Widget _buildTabButton(BuildContext context, int index) {
    List<Widget> children = [];

    if (widget.items[index].icon != null) {
      children.add(_buildTabButtonIcon(context, index));
      children.add(const SizedBox(width: 4));
    }
    if (widget.items[index].title != null) {
      children.add(_buildTabButtonTitle(context, index));
    }

    return GestureDetector(
      onTap: () => _tabController?.animateTo(index),
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
    bool isSelected = index == _tabController?.index;

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

  Widget _buildTabBarRow(BuildContext context) {
    return Container(
      height: _kTabHeight,
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
          widget.items.length,
          (index) => _buildTabBarItem(context, index),
        ),
      ),
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: widget.items.map((e) => e.body).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildTabBarRow(context));
    children.add(_buildTabBarView(context));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
