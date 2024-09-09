import 'package:flutter/material.dart';
import '../styles/theme_data.dart';

const double _kThickness = 4;

const double _kScrollBarRightPadding = 2;

Color _getScrollbarColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.transparent1002;
}

class BWScrollBar extends StatelessWidget {
  /// ## Scroll Bar
  ///
  /// ### Parameters:
  /// * **child**(Widget,***required***): 內容
  /// * **controller**(ScrollController,_optional_): 滾輪控制
  /// * **horizontalPadding**(double,_optional_): 橫向Padding
  ///
  /// ### Example:
  /// ```dart
  /// BWScrollBar(
  ///   child: SizedBox(height: 100),
  ///   controller: ScrollController(),
  /// );
  /// ```
  const BWScrollBar({
    super.key,
    required this.child,
    this.controller,
    this.horizontalPadding = 0,
  }) : assert(horizontalPadding >= 0);

  /// 內容
  final Widget child;

  /// 滾輪控制
  final ScrollController? controller;

  /// 橫向Padding
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thickness: _kThickness,
      radius: const Radius.circular(4),
      thumbColor: _getScrollbarColor(context),
      controller: controller,
      thumbVisibility: false,
      minThumbLength: 56,
      // 滾輪距離右邊的距離
      padding: const EdgeInsets.only(right: _kScrollBarRightPadding),
      child: Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
        ),
        child: child,
      ),
    );
  }
}
