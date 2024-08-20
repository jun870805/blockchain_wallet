import 'package:flutter/material.dart';
import '../styles/styles.dart';

enum DividerType { horizontal, vertical }

Color _getLineColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.transparent1002;
}

class BWDivider extends StatelessWidget {
  /// ## Divider 分隔線
  ///
  /// ### Parameters:
  /// * **type**(DividerType,***required***): 類形(橫式/直式)
  /// * **color**(Color,_optional_): 顏色
  /// * **length**(double,_optional_): 長度(沒帶則是撐滿)
  /// * **thickness**(double,_optional_): 厚度
  ///
  /// ### Example:
  /// ```dart
  /// BWDivider(type: DividerType.horizontal);
  /// ```
  const BWDivider({
    super.key,
    required this.type,
    this.color,
    this.length,
    this.thickness = 1.0,
  });

  /// 類形(橫式/直式)
  final DividerType type;

  /// 顏色
  final Color? color;

  /// 長度(沒帶則是撐滿)
  final double? length;

  /// 厚度
  final double thickness;

  @override
  Widget build(BuildContext context) {
    if (type == DividerType.horizontal) {
      return Container(
        width: length ?? double.infinity,
        height: thickness,
        color: color ?? _getLineColor(context),
      );
    } else {
      return Container(
        width: thickness,
        height: length ?? double.infinity,
        color: color ?? _getLineColor(context),
      );
    }
  }
}
