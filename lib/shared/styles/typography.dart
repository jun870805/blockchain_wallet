import 'package:flutter/material.dart';

// 因為5個字元可能會導致被自動換行，故設定為設計-0.01
const _errorFontSize = 0.01;

@immutable
class BWTypography {
  const BWTypography({
    this.displayLarge = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 57.0 - _errorFontSize,
      height: 1.3,
    ),
    this.displayMedium = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 45.0 - _errorFontSize,
      height: 1.3,
    ),
    this.displaySmall = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 36.0 - _errorFontSize,
      height: 1.3,
    ),
    this.headlineLarge = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 32.0 - _errorFontSize,
      height: 1.3,
    ),
    this.headlineMediumBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 28.0 - _errorFontSize,
      height: 1.3,
    ),
    this.headlineMediumRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 28.0 - _errorFontSize,
      height: 1.3,
    ),
    this.headlineSmallBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 24.0 - _errorFontSize,
      height: 1.3,
    ),
    this.headlineSmallRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 24.0 - _errorFontSize,
      height: 1.3,
    ),
    this.titleLargeBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 22.0 - _errorFontSize,
      height: 1.5,
    ),
    this.titleLargeRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 22.0 - _errorFontSize,
      height: 1.5,
    ),
    this.titleMediumBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 20.0 - _errorFontSize,
      height: 1.5,
    ),
    this.titleMediumRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 20.0 - _errorFontSize,
      height: 1.5,
    ),
    this.titleSmallBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 16.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    this.titleSmallRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 16.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    this.titleExtraSmallBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.1,
    ),
    this.titleExtraSmallRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.1,
    ),
    this.bodyLargeRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 16.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.bodyLargeBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 16.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.bodyMediumRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.25,
    ),
    this.bodyMediumBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.25,
    ),
    this.bodySmallRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 12.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.25,
    ),
    this.bodySmallBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 12.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.1,
    ),
    this.buttonLargeRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 16.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.buttonLargeBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 16.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.buttonMediumRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.buttonMediumBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.buttonSmallRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 12.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.buttonSmallBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 12.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.labelLargeRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.1,
    ),
    this.labelLargeBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 14.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.1,
    ),
    this.labelMediumRegular = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.normal,
      fontSize: 12.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    this.labelMediumBold = const TextStyle(
      fontFamily: 'MicrosoftJhengHei',
      fontWeight: FontWeight.bold,
      fontSize: 12.0 - _errorFontSize,
      height: 1.5,
      letterSpacing: 0.5,
    ),
  });

  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  final TextStyle headlineLarge;
  final TextStyle headlineMediumBold;
  final TextStyle headlineMediumRegular;
  final TextStyle headlineSmallBold;
  final TextStyle headlineSmallRegular;

  final TextStyle titleLargeBold;
  final TextStyle titleLargeRegular;
  final TextStyle titleMediumBold;
  final TextStyle titleMediumRegular;
  final TextStyle titleSmallBold;
  final TextStyle titleSmallRegular;
  final TextStyle titleExtraSmallBold;
  final TextStyle titleExtraSmallRegular;

  final TextStyle bodyLargeRegular;
  final TextStyle bodyLargeBold;
  final TextStyle bodyMediumRegular;
  final TextStyle bodyMediumBold;
  final TextStyle bodySmallRegular;
  final TextStyle bodySmallBold;

  final TextStyle buttonLargeRegular;
  final TextStyle buttonLargeBold;
  final TextStyle buttonMediumRegular;
  final TextStyle buttonMediumBold;
  final TextStyle buttonSmallRegular;
  final TextStyle buttonSmallBold;

  final TextStyle labelLargeRegular;
  final TextStyle labelLargeBold;
  final TextStyle labelMediumRegular;
  final TextStyle labelMediumBold;
}
