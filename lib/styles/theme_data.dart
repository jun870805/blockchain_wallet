import 'package:flutter/material.dart';
import 'styles.dart';

// 使用方法：Theme.of(context).extension<BWThemeData>()!.color.title

@immutable
class BWThemeData extends ThemeExtension<BWThemeData> {
  const BWThemeData({
    required this.color,
    required this.shadow,
    required this.typography,
  });

  final BWColor color;
  final BWShadow shadow;
  final BWTypography typography;

  @override
  ThemeExtension<BWThemeData> copyWith({
    BWColor? color,
    BWShadow? shadow,
    BWTypography? typography,
  }) {
    return BWThemeData(
      color: color ?? this.color,
      shadow: shadow ?? this.shadow,
      typography: typography ?? this.typography,
    );
  }

  @override
  ThemeExtension<BWThemeData> lerp(
    covariant ThemeExtension<BWThemeData>? other,
    double t,
  ) {
    // 未來可以實作切換深色模式動畫
    return this;
  }
}
