import 'package:flutter/material.dart';
import '../../../../../core/models/models.dart';
import '../../components.dart';

class BWTabBarLayout extends StatefulWidget {
  /// ## Tab Bar Layout (包含TabBar和TabBarView)
  ///
  /// ### Parameters:
  /// * **items**(List<BarItem>,***required***): 項目
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
  });

  /// 項目
  final List<BarItem> items;

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
    List<Widget> children = [];

    children.add(_buildTabBar(context));
    children.add(_buildTabBarView(context));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
