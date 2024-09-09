import 'package:blockchain_wallet/shared/components/components.dart';
import 'package:flutter/material.dart';

class BWListView extends StatelessWidget {
  /// ## Scroll Bar
  ///
  /// ### Parameters:
  /// * **controller**(ScrollController,_optional_): 滾輪控制
  /// * **children**(List<Widget>,***required***): 內容
  /// * **horizontalPadding**(double,_optional_): 橫向Padding
  ///
  /// ### Example:
  /// ```dart
  /// BWListView(
  ///   children: [
  ///     SizedBox(height: 100),
  ///     SizedBox(height: 100),
  ///     SizedBox(height: 100),
  ///   ],
  /// );
  /// ```
  ///
  const BWListView({
    super.key,
    this.controller,
    required this.children,
    this.horizontalPadding = 16,
  }) : assert(horizontalPadding >= 0);

  /// 滾輪控制
  final ScrollController? controller;

  /// 內容
  final List<Widget> children;

  /// 橫向Padding
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BWScrollBar(
      controller: controller,
      horizontalPadding: horizontalPadding,
      child: ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: children,
      ),
    );
  }
}
