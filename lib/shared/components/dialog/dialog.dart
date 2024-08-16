import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../styles/styles.dart';

export './detail_dialog.dart';

const EdgeInsets _kDialogPadding = EdgeInsets.symmetric(
  horizontal: 24,
  vertical: 56,
);

const BorderRadius _kBorderRadius = BorderRadius.all(Radius.circular(24.0));

Border _getBorder(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return Border.all(
    color: themeData.color.background02,
    width: 1.0,
  );
}

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

List<BoxShadow> _getBoxShadow(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.shadow.light;
}

class BWDialog extends StatelessWidget {
  /// ## BWDialog
  /// * Creates a dialog.
  /// * Typically used in conjunction with [showBWDialog].
  ///
  /// ### Parameters:
  /// * **child**(Widget,_optional_): 自定義Widget

  const BWDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        padding: _kDialogPadding,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: _getBoxShadow(context),
            borderRadius: _kBorderRadius,
            border: _getBorder(context),
            color: _getBackgroundColor(context),
          ),
          child: child,
        ),
      ),
    );
  }
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
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

const Duration _kDuration = Duration(milliseconds: 10);

Color _getBarrierColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.transparent1001;
}

Future<T?> showBWDialog<T extends Object?>({
  required BuildContext context,
  required WidgetBuilder builder,
  RouteSettings? routeSettings,

  /// 點擊外部區域是否關閉視窗
  bool barrierDismissible = false,
}) {
  return showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierColor: _getBarrierColor(context),
    barrierDismissible: barrierDismissible,
    transitionDuration: _kDuration,
    transitionBuilder: _buildDialogTransitions,
    useRootNavigator: false,
    routeSettings: routeSettings,
    pageBuilder: (
      BuildContext buildContext,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final Widget pageChild = Builder(builder: builder);

      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Builder(
          builder: (BuildContext context) {
            return SafeArea(child: pageChild);
          },
        ),
      );
    },
  );
}
