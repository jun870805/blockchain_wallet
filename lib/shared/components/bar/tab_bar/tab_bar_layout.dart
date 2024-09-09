import 'package:flutter/material.dart';
import '../../../../../core/models/models.dart';
import '../../components.dart';

class BWTabBarLayout extends StatefulWidget {
  /// ## Tab Bar Layout (包含TabBar和TabBarView)
  ///
  /// ### Parameters:
  /// * **items**(List<BarItem>,***required***): 項目
  /// * **top**(List<BarItem>,_optional_): 滾動後要消失的view(可以不填)
  /// * **topHeight**(List<BarItem>,_optional_): top view的高度
  ///
  /// ### Example:
  /// ```dart
  /// BWTabBarLayout(
  ///   items: [],
  /// );
  /// ```
  const BWTabBarLayout({
    super.key,
    required this.items,
    this.top,
    this.topHeight = 0,
  });

  /// 項目
  final List<BarItem> items;

  /// 滾動後要消失的view(可以不填)
  final Widget? top;

  /// top view的高度
  final double? topHeight;

  @override
  State<BWTabBarLayout> createState() => _BWTabBarLayoutState();
}

class _BWTabBarLayoutState extends State<BWTabBarLayout>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.items.length,
      vsync: this,
    );
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(() => setState(() {}));

    super.dispose();
  }

  Widget _buildTabBar(BuildContext context) {
    return BWTabBar(
      items: widget.items,
      controller: _controller,
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    return BWTabBarView(
      items: widget.items,
      controller: _controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BWStickyLayout(
      top: widget.top,
      topHeight: widget.topHeight,
      header: _buildTabBar(context),
      headerHeight: kTabBarHeight,
      body: _buildTabBarView(context),
    );
  }
}
