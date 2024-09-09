import 'package:flutter/material.dart';
import '../../../../../core/models/models.dart';

class BWTabBarView extends StatelessWidget {
  /// ## Tab Bar View
  ///
  /// ### Parameters:
  /// * **items**(List<BarItem>,***required***): 項目
  /// * **controller**(TabController,***required***): tab控制器
  ///
  /// ### Example:
  /// ```dart
  /// BWTabBarView(
  ///   items: [],
  ///   controller: TabController(),
  /// );
  /// ```
  const BWTabBarView({
    super.key,
    required this.items,
    required this.controller,
  });

  /// 項目
  final List<BarItem> items;

  /// 控制器
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: items.map((e) => e.body).toList(),
    );
  }
}
