import 'package:blockchain_wallet/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../../core/models/models.dart';

const double _kTabHeight = 24.0;

const double _kTabButtonIconSize = 18.0;

const EdgeInsets _kTabBarPadding = EdgeInsets.only(
  left: 16.0,
);

const EdgeInsets _kTabButtonPadding = EdgeInsets.only(
  right: 16.0,
);

const EdgeInsets _kTabButtonIconPadding = EdgeInsets.only(
  top: 1.5,
);

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

Color _getTabButtonIconColor(BuildContext context, bool isSelected) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return isSelected ? themeData.color.primary : themeData.color.title;
}

TextStyle _getTabButtonTitleTextStyle(BuildContext context, bool isSelected) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  if (isSelected) {
    return themeData.typography.titleMediumBold.apply(
      color: themeData.color.primary,
    );
  } else {
    return themeData.typography.titleMediumRegular.apply(
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

    return Padding(
      padding: _kTabButtonPadding,
      child: GestureDetector(
        onTap: () => _tabController?.animateTo(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      height: _kTabHeight,
      width: double.infinity,
      color: _getBackgroundColor(context),
      child: SingleChildScrollView(
        padding: _kTabBarPadding,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) => _buildTabButton(context, index),
          ),
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

    children.add(_buildTabBar(context));
    children.add(const SizedBox(height: 16));
    children.add(_buildTabBarView(context));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
