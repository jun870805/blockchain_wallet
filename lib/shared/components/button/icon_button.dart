import 'package:flutter/material.dart';
import '../../styles/styles.dart';

const double _kSize = 24.0;

Color _getIconColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.title;
}

class BWIconButton extends StatelessWidget {
  /// ## Icon Button
  /// ### Parameters:
  /// * **icon**(IconData,***required***): Icon
  /// * **color**(Color,_optional_): 按鈕顏色(預設title)
  /// * **size**(double,_optional_): 大小(預設24)
  /// * **onPressed**(VoidCallback,_optional_): 點擊事件
  ///
  /// ### Example:
  /// ```dart
  /// BWIconButton(
  ///   icon: Icons.close,
  ///   onPressed: () {
  ///     print('click close icon');
  ///   },
  /// );
  /// ```
  const BWIconButton({
    super.key,
    required this.icon,
    this.color,
    this.size,
    this.onPressed,
  });

  /// Icon
  final IconData icon;

  /// 按鈕顏色(預設title)
  final Color? color;

  /// 大小(預設24)
  final double? size;

  /// 點擊事件
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        size: size ?? _kSize,
        color: color ?? _getIconColor(context),
      ),
    );
  }
}
