import 'package:flutter/material.dart';

@immutable
class BWColor {
  const BWColor.bright({
    this.primary = const Color(0xFF2A9CBF),
    this.primaryShade = const Color(0xFF2487A5),
    this.primaryTint = const Color(0xFF3DB1D5),
    this.secondary = const Color(0xFF1B657C),
    this.secondaryShade = const Color(0xFF18586C),
    this.secondaryTint = const Color(0xFF2589A7),
    this.neutral00 = const Color(0xFF000000),
    this.neutral01 = const Color(0xFF121212),
    this.neutral02 = const Color(0xFF242424),
    this.neutral03 = const Color(0xFF373737),
    this.neutral04 = const Color(0xFF494949),
    this.neutral05 = const Color(0xFF5B5B5B),
    this.neutral06 = const Color(0xFF6D6D6D),
    this.neutral07 = const Color(0xFF808080),
    this.neutral08 = const Color(0xFF929292),
    this.neutral09 = const Color(0xFFA4A4A4),
    this.neutral10 = const Color(0xFFB6B6B6),
    this.neutral11 = const Color(0xFFC8C8C8),
    this.neutral12 = const Color(0xFFDBDBDB),
    this.neutral13 = const Color(0xFFEDEDED),
    this.neutral14 = const Color(0xFFFFFFFF),
    this.background = const Color(0xFFFFFFFF),
    this.background01 = const Color(0xFFFAFAFA),
    this.background02 = const Color(0xFFF5F5F5),
    this.background03 = const Color(0xFFE2E2E2),
    this.title = const Color(0xFF121212),
    this.article = const Color(0xFF373737),
    this.note = const Color(0xFF6D6D6D),
    this.placeholder = const Color(0xFFC8C8C8),
    this.success = const Color(0xFF88CC88),
    this.warning = const Color(0xFFF0CF57),
    this.error = const Color(0xFFF06F6F),
    this.gradientPrimary = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF2A9CBF),
        Color(0xFF1E7089),
      ],
    ),
    this.gradientSecondary = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF1B657C),
        Color(0xFF0F3845),
      ],
    ),
  });

  const BWColor.dark({
    this.primary = const Color(0xFF84CEE4),
    this.primaryShade = const Color(0xFF5BBDDB),
    this.primaryTint = const Color(0xFF97D5E8),
    this.secondary = const Color(0xFF31ACD2),
    this.secondaryShade = const Color(0xFF2896B7),
    this.secondaryTint = const Color(0xFF4FB8D8),
    this.neutral00 = const Color(0xFF000000),
    this.neutral01 = const Color(0xFF121212),
    this.neutral02 = const Color(0xFF242424),
    this.neutral03 = const Color(0xFF373737),
    this.neutral04 = const Color(0xFF494949),
    this.neutral05 = const Color(0xFF5B5B5B),
    this.neutral06 = const Color(0xFF6D6D6D),
    this.neutral07 = const Color(0xFF808080),
    this.neutral08 = const Color(0xFF929292),
    this.neutral09 = const Color(0xFFA4A4A4),
    this.neutral10 = const Color(0xFFB6B6B6),
    this.neutral11 = const Color(0xFFC8C8C8),
    this.neutral12 = const Color(0xFFDBDBDB),
    this.neutral13 = const Color(0xFFEDEDED),
    this.neutral14 = const Color(0xFFFFFFFF),
    this.background = const Color(0xFF121212),
    this.background01 = const Color(0xFF1A1A1A),
    this.background02 = const Color(0xFF262626),
    this.background03 = const Color(0xFF333333),
    this.title = const Color(0xFFFFFFFF),
    this.article = const Color(0xFFDBDBDB),
    this.note = const Color(0xFFA4A4A4),
    this.placeholder = const Color(0xFF494949),
    this.success = const Color(0xFF88CC88),
    this.warning = const Color(0xFFF0CF57),
    this.error = const Color(0xFFF06F6F),
    this.gradientPrimary = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF84CEE4),
        Color(0xFF5BBDDB),
      ],
    ),
    this.gradientSecondary = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF31ACD2),
        Color(0xFF2896B7),
      ],
    ),
  });

  final Color primary;
  final Color primaryShade;
  final Color primaryTint;

  final Color secondary;
  final Color secondaryShade;
  final Color secondaryTint;

  final Color neutral00;
  final Color neutral01;
  final Color neutral02;
  final Color neutral03;
  final Color neutral04;
  final Color neutral05;
  final Color neutral06;
  final Color neutral07;
  final Color neutral08;
  final Color neutral09;
  final Color neutral10;
  final Color neutral11;
  final Color neutral12;
  final Color neutral13;
  final Color neutral14;

  final Color background;
  final Color background01;
  final Color background02;
  final Color background03;

  final Color title;
  final Color article;
  final Color note;
  final Color placeholder;

  final Color success;
  final Color warning;
  final Color error;

  final Gradient gradientPrimary;
  final Gradient gradientSecondary;
}
