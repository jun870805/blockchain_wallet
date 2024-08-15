import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../styles/styles.dart';

export './detail_dialog.dart';

const BorderRadius _kBorderRadius = BorderRadius.all(Radius.circular(16.0));

const BoxConstraints _kConstraints = BoxConstraints(minWidth: 280.0);

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

  return themeData.shadow.medium;
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
      child: Padding(
        padding: EdgeInsets.only(
          left: 32,
          top: 56,
          right: 32,
          bottom: 56 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: _kConstraints,
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

  return themeData.color.transparent1002.withOpacity(0.5);
}

Future<T?> showBWDialog<T extends Object?>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = false,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  bool isBlur = true,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (
      BuildContext buildContext,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final Widget pageChild = Builder(builder: builder);
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: SafeArea(
          child: Builder(builder: (BuildContext context) {
            return pageChild;
          }),
        ),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    barrierColor: _getBarrierColor(context),
    transitionDuration: _kDuration,
    transitionBuilder: _buildDialogTransitions,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
  );
}
