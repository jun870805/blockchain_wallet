import 'package:flutter/material.dart';
import '../styles/styles.dart';

enum DividerType { horizontal, vertical }

Color _getLineColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.transparent1002;
}

class BWDivider extends StatelessWidget {
  /// ## Divider 分隔線
  /// ### Parameters:
  /// * **type**(DividerType,***required***): 類形(橫式/直式)
  /// * **color**(Color,_optional_): 顏色
  /// * **length**(double,_optional_): 長度(沒帶則是撐滿)
  /// * **thickness**(double,_optional_): 厚度
  ///
  /// ### Example:
  /// ```dart
  /// EXDivider();
  /// ```
  ///
  /// 因外層的容器可能有ListView這種擁有無限長度的容器
  /// 可能會發生無法自動填滿導致發生錯誤，解決方式如下
  /// 例如當 DividerType.Vertical 時，
  /// 將父容器使用IntrinsicHeight強制 EXDivider 適應父容器的高度
  /// ### Example:
  /// ```dart
  /// IntrinsicHeight(
  ///   child: Row(
  ///     children: [
  ///      EXDivider(
  ///        type: DividerType.Vertical,
  ///      ),
  ///     ],
  ///   ),
  /// )
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
