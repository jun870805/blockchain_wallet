import 'package:flutter/material.dart';

class BarItem {
  BarItem({
    this.icon,
    this.activeIcon,
    this.title,
    required this.body,
  });

  /// icon
  final IconData? icon;

  /// 圖片
  final IconData? activeIcon;

  /// 標題
  final String? title;

  /// body(必填)
  final Widget body;
}
