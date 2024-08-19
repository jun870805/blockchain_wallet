import 'package:flutter/material.dart';
import '../styles/styles.dart';

const double _kLabelMinHeight = 32.0;

const double _kLabelMinWidth = 120.0;

const Duration _kAnimationDuration = Duration(milliseconds: 250);

const Duration _kHudDuration = Duration(seconds: 1);

const EdgeInsets _kLabelPadding = EdgeInsets.symmetric(
  horizontal: 8.0,
  vertical: 4.0,
);
const BorderRadius _kLabelBorderRadius = BorderRadius.all(
  Radius.circular(4.0),
);

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.transparent1003;
}

TextStyle _getTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodySmallRegular.apply(
    color: themeData.color.neutral14,
  );
}

Widget _buildDialogTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeInToLinear,
    ),
    child: child,
  );
}

class BWToast extends StatelessWidget {
  /// ## Toast 提示彈窗(覆蓋在所有之上,畫面會暫時無法操作,持續兩秒)
  /// * 常用於服務條款
  /// ### Parameters:
  /// * **text**(String,***required***): 提示文字
  ///
  /// ### Example:
  /// ```dart
  ///
  /// BWToast(
  ///   text: S.of(context).copyToClipboard,
  /// ).show(context);
  /// ```
  const BWToast({
    super.key,
    required this.text,
  });

  ///  提示文字
  final String text;

  Widget _buildLabel(BuildContext context) {
    return Positioned(
      bottom: 94,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: _kLabelMinWidth,
          minHeight: _kLabelMinHeight,
        ),
        padding: _kLabelPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: _kLabelBorderRadius,
          color: _getBackgroundColor(context),
        ),
        child: Text(
          text,
          style: _getTextStyle(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildLabel(context));

    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: children,
      ),
    );
  }

  Future<T?> show<T extends Object?>(BuildContext context) async {
    Future.delayed(_kHudDuration, () {
      Navigator.of(context).pop(true);
    });

    return showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext buildContext,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return this;
            },
          ),
        );
      },
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.transparent,
      transitionDuration: _kAnimationDuration,
      transitionBuilder: _buildDialogTransitions,
      useRootNavigator: true,
    );
  }
}
